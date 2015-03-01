#ifndef INLOVSERVICE_H
#define INLOVSERVICE_H

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

    Q_INVOKABLE bool isFileExist(QString filename);
    Q_INVOKABLE void writeFile(QString filename, QString text);
    Q_INVOKABLE bool removeFile(QString filename);
    Q_INVOKABLE QString readFile(QString filename);

private:
    static inlovService* instance_;

    QNetworkAccessManager *m_networkAccessManager;
    QNetworkReply *m_currentReply;

    QString m_textDebug;
    bool m_loadBusy;
    QString m_secretCode;

signals:
    void textDebugChanged();
    void loadBusyChanged();
    void secretCodeChanged();

public slots:
    void cancelLoad();

    void serviceLogin(QString secretCode);

    void loadSecretCode(QString secretCode);
    void secretCodeFinishLoaded();
    void readSecretCodeFile();

    void loadEventLink(QString eventLinkPath);
    void eventLinkFinishLoaded();
    void readEvenLinkFile();

    void loadAttendees(QString eventId);
    void attendeesFinishLoaded();
    void readAttendeesFile();
};

#endif // INLOVSERVICE_H
