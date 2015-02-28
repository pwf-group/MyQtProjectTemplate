#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "myapplication.h"

MyApplication theApp;
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setOrganizationName("PW & Friend");
    app.setOrganizationDomain("waiwaibaka.com");
    app.setApplicationName("InLov");

    theApp.start();

    return app.exec();
}
