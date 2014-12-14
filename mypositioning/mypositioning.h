#ifndef MYLOCATION_H
#define MYLOCATION_H

#include <QObject>
#include <QPointF>
#include <QGeoPositionInfo>
#include <QGeoPositionInfoSource>

class MyPosition : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QPointF coordinate READ coordinate WRITE setCoordinate NOTIFY coordinateChanged)
    Q_PROPERTY(bool valid READ valid WRITE setValid NOTIFY validChanged)

private: // attributes
    QPointF m_coordinate;
    bool    m_valid;
    bool    m_simulate;

public: // methods
    explicit MyPosition(QObject *parent = 0);
    ~MyPosition();

    void startPositioning();

    void setCoordinate(const QPointF &d);
    QPointF coordinate() const;

    void setValid(const bool &b);
    bool valid() const;

    void setSimulate(const bool &b);

signals:
    void coordinateChanged();
    void validChanged();

    void PositioningErrorString(QString error);

public slots:
    void PositioningUpdate(const QGeoPositionInfo &info);
    void PositioningError(QGeoPositionInfoSource::Error positioningError);
};

#endif // MYLOCATION_H
