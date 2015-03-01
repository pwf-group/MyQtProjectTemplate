#include "inlovservice.h"
#include "eventdetails.h"
#include "myapplication.h"

#include <QtQml>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <QTextStream>

inlovService* inlovService::instance_ = NULL;

static QObject *example_qobject_singletontype_inlovService(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    inlovService *p = inlovService::instance();
    return p;
}

inlovService::inlovService(QObject *parent) : QObject(parent),
    m_networkAccessManager(theApp.networkAccessManager),
    m_currentReply(NULL),
    m_loadBusy(false)
{
    // chain of command for serviceLoader()
    connect(this,SIGNAL(readSecretCodeFinished()),this,SLOT(serviceLoaderEventLink()));
    connect(this,SIGNAL(readEventLinkFinished()),this,SLOT(serviceLoaderAttendees()));
}

inlovService::~inlovService()
{

}

inlovService* inlovService::instance()
{
    if (instance_ == NULL)
        instance_ = new inlovService();
    return instance_;
}

void inlovService::registerSingletonType()
{
    qmlRegisterSingletonType<inlovService>("inlov.api", 1, 0, "InLovService", example_qobject_singletontype_inlovService);
}

QString inlovService::textDebug() const
{
    return m_textDebug;
}

void inlovService::setTextDebug(QString text)
{
    m_textDebug = text;
    emit textDebugChanged();
}

bool inlovService::loadBusy() const
{
    return m_loadBusy;
}

void inlovService::setLoadBusy(bool flag)
{
    m_loadBusy = flag;
    emit loadBusyChanged();
}

QString inlovService::secretCode() const
{
    return m_secretCode;
}

void inlovService::setSecretCode(QString text)
{
    m_secretCode = text;
    emit secretCodeChanged();
}

void inlovService::serviceLogin(QString secretCode)
{
    setSecretCode(secretCode);
    QTimer::singleShot(0,this,SLOT(serviceLoader()));
}

QObject* inlovService::eventDetails()
{
    return &m_eventDetails;
}

QObject* inlovService::attendeesModel()
{
    return &m_attendeesModel;
}

bool inlovService::isFileExist(QString filename)
{
    QFile Fout;
    Fout.setFileName(filename);
    if(!Fout.exists())
        return false;
    else
        return true;
}

void inlovService::writeFile(QString filename, QString text)
{
    QFile file(filename);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QTextStream out(&file);
    out << text;

    // optional, as QFile destructor will already do it:
    file.close();
}

bool inlovService::removeFile(QString filename)
{
    return QFile::remove(filename);
}

QString inlovService::readFile(QString filename)
{
    QFile file(filename);
    if(!file.open(QIODevice::ReadOnly)) {
        return "";
    }

    QTextStream in(&file);
    QString content = in.readAll();
    file.close();

    return content;
}

void inlovService::cancelLoad()
{

}

void inlovService::serviceLoader()
{
    serviceLoaderSecretCode();
}

void inlovService::serviceLoaderSecretCode()
{
    if(isFileExist(secretCode() + ".json"))
        QTimer::singleShot(0,this,SLOT(readSecretCodeFile()));
    else
        QTimer::singleShot(0,this,SLOT(loadSecretCode()));
}

void inlovService::serviceLoaderEventLink()
{
    if(isFileExist(secretCode() + "_event.json"))
        QTimer::singleShot(0,this,SLOT(readEventLinkFile()));
    else
        QTimer::singleShot(0,this,SLOT(loadEventLink()));
}

void inlovService::serviceLoaderAttendees()
{
    if(isFileExist(secretCode() + "_attendees.json"))
        QTimer::singleShot(0,this,SLOT(readAttendeesFile()));
    else
        QTimer::singleShot(0,this,SLOT(loadAttendees()));
}

void inlovService::loadSecretCode()
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev/code/%1.json").arg(secretCode())));

    request.setSslConfiguration(QSslConfiguration::defaultConfiguration());
    request.setAttribute(QNetworkRequest::HttpPipeliningAllowedAttribute, true);
    m_currentReply = m_networkAccessManager->get(request);

    QObject::connect(m_currentReply, SIGNAL(finished()), this, SLOT(secretCodeFinishLoaded()));
    setLoadBusy(true);
}

void inlovService::secretCodeFinishLoaded()
{
    if( m_currentReply->error() == QNetworkReply::NoError )
    {
        QByteArray reply_json = m_currentReply->readAll();
        //qDebug() << QString::fromUtf8(reply_json);

        writeFile(secretCode() + ".json", QString::fromUtf8(reply_json));
        QTimer::singleShot(0,this,SLOT(readSecretCodeFile()));
    }
    else
    {
        qDebug() << "Failure" << m_currentReply->errorString();
    }

    m_currentReply->deleteLater();
    m_currentReply = NULL;

    setLoadBusy(false);
}

void inlovService::readSecretCodeFile()
{
    QString data = readFile(secretCode() + ".json");
    if(data.isEmpty())
        return;

    QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
    QJsonObject jsonRootObj = jsonDoc.object();

    m_eventId = jsonRootObj.value("eventId").toString();
    m_eventLink = jsonRootObj.value("eventLink").toString();
    setTextDebug("eventId: " + m_eventId +
                 "\neventLink: " + m_eventLink);

    emit readSecretCodeFinished();
}

void inlovService::loadEventLink()
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev%1.json").arg(m_eventLink)));

    request.setSslConfiguration(QSslConfiguration::defaultConfiguration());
    request.setAttribute(QNetworkRequest::HttpPipeliningAllowedAttribute, true);
    m_currentReply = m_networkAccessManager->get(request);

    QObject::connect(m_currentReply, SIGNAL(finished()), this, SLOT(eventLinkFinishLoaded()));
    setLoadBusy(true);
}

void inlovService::eventLinkFinishLoaded()
{
    if( m_currentReply->error() == QNetworkReply::NoError )
    {
        QByteArray reply_json = m_currentReply->readAll();
        //qDebug() << QString::fromUtf8(reply_json);

        writeFile(secretCode() + "_event.json", QString::fromUtf8(reply_json));
    }
    else
    {
        qDebug() << "Failure" << m_currentReply->errorString();
    }

    m_currentReply->deleteLater();
    m_currentReply = NULL;

    setLoadBusy(false);
}

void inlovService::readEventLinkFile()
{
    QString data = readFile(secretCode() + "_event.json");
    if(data.isEmpty())
        return;

    QJsonDocument jsonDoc = QJsonDocument::fromJson(data.toUtf8());
    QJsonObject jsonRootObj = jsonDoc.object();

    QString description = jsonRootObj.value("description").toString();
    QString eventName = jsonRootObj.value("eventName").toString();
    bool isPublished = jsonRootObj.value("isPublished").toBool();
    QString venue = jsonRootObj.value("venue").toString();

    m_eventDetails.setDescription(description);
    m_eventDetails.setEventName(eventName);
    m_eventDetails.setIsPublished(isPublished);
    m_eventDetails.setVenue(venue);

    setTextDebug("description: " + description +
                 "\neventName: " + eventName +
                 "\nvenue: " + venue +
                 "\nisPublished: " + QString("%1").arg(isPublished));

    emit readEventLinkFinished();
}

void inlovService::loadAttendees()
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev/attendees/%1.json").arg(m_eventId)));

    request.setSslConfiguration(QSslConfiguration::defaultConfiguration());
    request.setAttribute(QNetworkRequest::HttpPipeliningAllowedAttribute, true);
    m_currentReply = m_networkAccessManager->get(request);

    QObject::connect(m_currentReply, SIGNAL(finished()), this, SLOT(attendeesFinishLoaded()));
    setLoadBusy(true);
}

void inlovService::attendeesFinishLoaded()
{
    if( m_currentReply->error() == QNetworkReply::NoError )
    {
        QByteArray reply_json = m_currentReply->readAll();
        //qDebug() << QString::fromUtf8(reply_json);

        writeFile(secretCode() + "_attendees.json", QString::fromUtf8(reply_json));
    }
    else
    {
        qDebug() << "Failure" << m_currentReply->errorString();
    }

    m_currentReply->deleteLater();
    m_currentReply = NULL;

    setLoadBusy(false);
}

void inlovService::readAttendeesFile()
{
    QString data = readFile(secretCode() + "_attendees.json");
    if(data.isEmpty())
        return;

    QJsonDocument jsonResponse = QJsonDocument::fromJson(data.toUtf8());
    QJsonObject jsonObject = jsonResponse.object();

    setTextDebug("");
    m_attendeesModel.empty();

    foreach(QString key, jsonObject.keys())
    {
        QJsonObject details = jsonObject.value(key).toObject();

        Attendance *attendance = new Attendance;
        attendance->name = details.value("name").toString();
        attendance->tableNumber = details.value("tableNumber").toInt();
        attendance->numberOfPax = details.value("numberOfPax").toInt();
        attendance->group = details.value("group").toString();
        attendance->chineseName = details.value("chineseName").toString();
        m_attendeesModel.addSource(attendance);

//        setTextDebug(m_textDebug +
//                     "\nname: " + name +
//                     "\ntableNumber: " + QString("%1").arg(tableNumber) +
//                     "\nnumberOfPax: " + QString("%1").arg(numberOfPax) +
//                     "\ngroup: " + group +
//                     "\nchineseName: " + chineseName );
    }

    emit readAttendeesFinished();
}
