#include "myapplication.h"
#include "myscreen.h"
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
    sProjectDirectory = QString::fromUtf8(getenv("EXTERNAL_STORAGE")).append(QDir::separator()).append("MapIT");
    if( !QDir(sProjectDirectory).exists() )
        QDir().mkdir(sProjectDirectory);
    if( !QDir(sProjectDirectory + QDir::separator() + "Image").exists() )
        QDir().mkdir(sProjectDirectory + QDir::separator() + "Image");
    if( !QDir(sProjectDirectory + QDir::separator() + "Data").exists() )
        QDir().mkdir(sProjectDirectory + QDir::separator() + "Data");
    if( !QDir(sProjectDirectory + QDir::separator() + "Field").exists() )
        QDir().mkdir(sProjectDirectory + QDir::separator() + "Field");

    networkAccessManager = engine->networkAccessManager();

    // initialize register type
    qmlRegisterSingletonType( QUrl("qrc:/UIConstants.qml"), "UIConstants", 1, 0, "UIConstants" );

    // initialize context
    engine->rootContext()->setContextProperty("MyApp", this);
    engine->rootContext()->setContextProperty("projectDirectory", sProjectDirectory);
    MyScreen myScreen;
    engine->rootContext()->setContextProperty("dp", myScreen.dp());

    // load display
    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
}

bool MyApplication::removeFile(QString file)
{
    return QFile::remove(file.mid(7));
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
