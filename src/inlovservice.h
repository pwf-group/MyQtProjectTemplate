#ifndef INLOVSERVICE_H
#define INLOVSERVICE_H

#include "eventdetails.h"
#include "attendeesmodel.h"

#include <QObject>
#include <QNetworkAccessManager>

class inlovService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textDebug READ textDebug WRITE setTextDebug NOTIFY textDebugChanged)
    Q_PROPERTY(bool loadBusy READ loadBusy WRITE setLoadBusy NOTIFY loadBusyChanged)
    Q_PROPERTY(QString secretCode READ secretCode WRITE setSecretCode NOTIFY secretCodeChanged)
public:
    explicit inlovService(QObject *parent = 0);
    ~inlovService();

    static inlovService* instance();
    static void registerSingletonType();

    QString textDebug() const;
    void setTextDebug(QString text);

    bool loadBusy() const;
    void setLoadBusy(bool flag);

    QString secretCode() const;
    void setSecretCode(QString text);

    Q_INVOKABLE void serviceLogin(QString secretCode);
    Q_INVOKABLE QObject* eventDetails();
    Q_INVOKABLE QObject* attendeesModel();

    Q_INVOKABLE bool isFileExist(QString filename);
    Q_INVOKABLE void writeFile(QString filename, QString text);
    Q_INVOKABLE bool removeFile(QString filename);
    Q_INVOKABLE QString readFile(QString filename);

private:
    static inlovService* instance_;

    QNetworkAccessManager *m_networkAccessManager;
    QNetworkReply *m_currentReply;

    // QML binding property
    QString m_textDebug;
    bool m_loadBusy;
    QString m_secretCode;

    // Service private usage property
    QString m_eventId;
    QString m_eventLink;

    EventDetails m_eventDetails;
    AttendeesModel m_attendeesModel;

signals:
    void textDebugChanged();
    void loadBusyChanged();
    void secretCodeChanged();

    void readSecretCodeFinished();
    void readEventLinkFinished();
    void readAttendeesFinished();

public slots:
    void cancelLoad();

    void serviceLoader();
    void serviceLoaderSecretCode();
    void serviceLoaderEventLink();
    void serviceLoaderAttendees();

    void loadSecretCode();
    void secretCodeFinishLoaded();
    void readSecretCodeFile();

    void loadEventLink();
    void eventLinkFinishLoaded();
    void readEventLinkFile();

    void loadAttendees();
    void attendeesFinishLoaded();
    void readAttendeesFile();
};

#endif // INLOVSERVICE_H
