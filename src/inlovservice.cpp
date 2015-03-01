#include "inlovservice.h"
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

void inlovService::serviceLogin(QString secretCode)
{
    setSecretCode(secretCode);
}

void inlovService::loadSecretCode(QString secretCode)
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev/code/%1.json").arg(secretCode)));

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

    QString eventId = jsonRootObj.value("eventId").toString();
    QString eventLink = jsonRootObj.value("eventLink").toString();
    setTextDebug("eventId: " + eventId +
                 "\neventLink: " + eventLink);
}

void inlovService::loadEventLink(QString eventLinkPath)
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev%1.json").arg(eventLinkPath)));

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

void inlovService::readEvenLinkFile()
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

    setTextDebug("description: " + description +
                 "\neventName: " + eventName +
                 "\nvenue: " + venue +
                 "\nisPublished: " + QString("%1").arg(isPublished));
}

void inlovService::loadAttendees(QString eventId)
{
    QNetworkRequest request(QUrl(QString("https://inlov.firebaseio.com/dev/attendees/%1.json").arg(eventId)));

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
    QString data = readFile(secretCode() + "_event.json");
    if(data.isEmpty())
        return;

    QJsonDocument jsonResponse = QJsonDocument::fromJson(data.toUtf8());
    QJsonObject jsonObject = jsonResponse.object();

    setTextDebug("");
    foreach(QString key, jsonObject.keys())
    {
        QJsonObject details = jsonObject.value(key).toObject();

        QString name = details.value("name").toString();
        int tableNumber = details.value("tableNumber").toInt();
        int numberOfPax = details.value("numberOfPax").toInt();
        QString group = details.value("group").toString();
        QString chineseName = details.value("chineseName").toString();

        setTextDebug(m_textDebug +
                     "\nname: " + name +
                     "\ntableNumber: " + QString("%1").arg(tableNumber) +
                     "\nnumberOfPax: " + QString("%1").arg(numberOfPax) +
                     "\ngroup: " + group +
                     "\nchineseName: " + chineseName );
    }
}
