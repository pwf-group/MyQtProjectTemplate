#include "myapplication.h"
#include "myscreen.h"
#include "inlovservice.h"

#include <QQmlContext>
#include <QtQml>
#include <QDir>

MyApplication::MyApplication(QObject *parent) :
    QObject(parent)
{
}

MyApplication::~MyApplication()
{
}

void MyApplication::start()
{
    engine = new QQmlApplicationEngine();

    // others initialization
    sProjectDirectory = "inlov";
    if( !QDir(sProjectDirectory).exists() )
        QDir().mkdir(sProjectDirectory);

    networkAccessManager = engine->networkAccessManager();

    // initialize register type
    qmlRegisterSingletonType( QUrl("qrc:/UIConstants.qml"), "UIConstants", 1, 0, "UIConstants" );
    inlovService::registerSingletonType();

    // initialize context
    engine->rootContext()->setContextProperty("MyApp", this);
    engine->rootContext()->setContextProperty("projectDirectory", sProjectDirectory);
    MyScreen myScreen;
    engine->rootContext()->setContextProperty("dp", myScreen.dp());

    // load display
    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
}

void MyApplication::toastMessage(QString sMessage)
{
    static QObject *object = NULL;

    if( !object )
    {
        QObject *temp = engine->rootObjects().first()->findChild<QObject*>("toast_message");
        if( temp )
            object = temp;
        else
            return;
    }

    QVariant returnedValue;
    QVariant var(sMessage);
    QMetaObject::invokeMethod(object, "show",
        Q_RETURN_ARG(QVariant, returnedValue),
        Q_ARG(QVariant, var));
}
