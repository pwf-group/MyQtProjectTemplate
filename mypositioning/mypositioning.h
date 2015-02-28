#ifndef MYLOCATION_H
#define MYLOCATION_H

#include <QObject>
//#include <QPointF>
#include <QGeoPositionInfo>
#include <QGeoPositionInfoSource>
#include <QGeoCoordinate>

class MyPosition : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QGeoCoordinate coordinate READ coordinate WRITE setCoordinate NOTIFY coordinateChanged)
    Q_PROPERTY(bool valid READ valid WRITE setValid NOTIFY validChanged)

private: // attributes
    QGeoCoordinate m_coordinate;
    bool    m_valid;
    bool    m_simulate;
    int     m_interval;

    static MyPosition *instance_;

public: // methods
    explicit MyPosition(QObject *parent = 0);
    static MyPosition* instance()
    {
        if (!instance_)
            instance_ = new MyPosition;
        return instance_;
    }

    ~MyPosition();

    void setCoordinate(const QGeoCoordinate &d);
    QGeoCoordinate coordinate() const;

    void setValid(const bool &b);
    bool valid() const;

    void setSimulate(const bool &b);
    void setInterval(const int &msec);

signals:
    void coordinateChanged();
    void validChanged();

    void PositioningErrorString(QString error);

public slots:
    void startPositioning();
    void stopPositioning();

    void PositioningUpdate(const QGeoPositionInfo &info);
    void PositioningError(QGeoPositionInfoSource::Error positioningError);
};

#endif // MYLOCATION_H
