#ifndef MYAPPLICATION_H
#define MYAPPLICATION_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

#define USE_SIMULATION_MODE 1
class MyApplication : public QObject
{
    Q_OBJECT

public: // attributes
    QQmlApplicationEngine *engine;
    QNetworkAccessManager *networkAccessManager;

    QString sProjectDirectory;

public:
    explicit MyApplication(QObject *parent = 0);
    ~MyApplication();

    void start();

signals:

public slots:
    void toastMessage(QString sMessage);
};

extern MyApplication theApp;

#endif // MYAPPLICATION_H
