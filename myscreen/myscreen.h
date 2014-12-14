#ifndef MYSCREEN_H
#define MYSCREEN_H

#include <QObject>

class MyScreen : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal dp READ dp WRITE setDp NOTIFY dpChanged)
    Q_PROPERTY(qreal dpi READ dpi WRITE setDpi NOTIFY dpiChanged)

private:
    qreal m_dp;
    qreal m_dpi;

public:
    explicit MyScreen(QObject *parent = 0);
    ~MyScreen();

    void setDp(const qreal &d);
    qreal dp() const;

    void setDpi(const qreal &d);
    qreal dpi() const;

signals:
    void dpChanged();
    void dpiChanged();

public slots:
};

#endif // MYSCREEN_H
