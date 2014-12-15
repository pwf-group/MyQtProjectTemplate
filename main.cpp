#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

#include "myscreen.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    MyScreen myScreen;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("dp", myScreen.dp());
    qmlRegisterSingletonType( QUrl("qrc:/UIConstants.qml"), "UIConstants", 1, 0, "UIConstants" );
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
