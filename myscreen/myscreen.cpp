#include <QtGui/QGuiApplication>
#include <QScreen>

#ifdef Q_OS_ANDROID
#include <QAndroidJniEnvironment>
#include <QAndroidJniObject>
#endif

#include "myscreen.h"

MyScreen::MyScreen(QObject *parent) : QObject(parent)
{
    Q_UNUSED(m_dpi);
 #ifdef Q_OS_ANDROID
     QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");
     QAndroidJniObject resource = activity.callObjectMethod("getResources","()Landroid/content/res/Resources;");
     QAndroidJniObject metrics = resource.callObjectMethod("getDisplayMetrics","()Landroid/util/DisplayMetrics;");
     setDpi(metrics.getField<int>("densityDpi"));
     setDp(metrics.getField<float>("density"));
 #else
    setDpi(QGuiApplication::primaryScreen()->physicalDotsPerInch());
    //setDp(dpi()/120);
    setDp(QGuiApplication::primaryScreen()->devicePixelRatio());
 #endif
}

MyScreen::~MyScreen()
{

}

void MyScreen::setDp(const qreal &r)
{
    if (m_dp == r)
        return;

    m_dp = r;
    emit dpChanged();
}
qreal MyScreen::dp() const
{
    return m_dp;
}

void MyScreen::setDpi(const qreal &r)
{
    if (m_dpi == r)
        return;

    m_dpi = r;
    emit dpiChanged();
}
qreal MyScreen::dpi() const
{
    return m_dpi;
}
