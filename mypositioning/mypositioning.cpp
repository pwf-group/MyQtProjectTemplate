#include <QGeoPositionInfo>
#include <QGeoPositionInfoSource>
#include <QGeoCoordinate>
#include <QDebug>

#include "logfilepositionsource.h"
#include "mypositioning.h"

//
// Shared Attributes
//
QGeoPositionInfoSource *pGeoPositionInfoSource = NULL;
LogFilePositionSource  *pLogPositionInfoSource = NULL;
bool                    bLocationCenter = false;

MyPosition::MyPosition(QObject *parent) :
    QObject(parent)
{
    m_coordinate = QPointF(0,0);
    m_valid      = false;
    m_simulate   = true;
}

MyPosition::~MyPosition()
{
    if(pGeoPositionInfoSource)
        pGeoPositionInfoSource->stopUpdates();

    if(pLogPositionInfoSource)
        pLogPositionInfoSource->stopUpdates();
}

void MyPosition::startPositioning()
{
    if(m_simulate == false)
    {
        if(pGeoPositionInfoSource == NULL)
        {
            pGeoPositionInfoSource = QGeoPositionInfoSource::createDefaultSource(0);
            if (pGeoPositionInfoSource) {
                qDebug() << "connect positionUpdated...";
                connect(pGeoPositionInfoSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                        this, SLOT(PositioningUpdate(QGeoPositionInfo)));
                connect(pGeoPositionInfoSource, SIGNAL(error(QGeoPositionInfoSource::Error)),
                        this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));

                qDebug() << "start position update...";
                pGeoPositionInfoSource->setUpdateInterval(3000);
                pGeoPositionInfoSource->startUpdates();

                QGeoPositionInfo info = pGeoPositionInfoSource->lastKnownPosition();

                QPointF pt(info.coordinate().longitude(), info.coordinate().latitude());
                setCoordinate(pt);
            }
        }
    }
    else
    {
        if(pLogPositionInfoSource == NULL)
        {
            pLogPositionInfoSource = new LogFilePositionSource;

            qDebug() << "connect positionUpdated...";
            connect(pLogPositionInfoSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                    this, SLOT(PositioningUpdate(QGeoPositionInfo)));
            connect(pLogPositionInfoSource, SIGNAL(error(QGeoPositionInfoSource::Error)),
                    this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));

            qDebug() << "start position update using log file...";
            pLogPositionInfoSource->setUpdateInterval(3000);
            pLogPositionInfoSource->startUpdates();

            QGeoPositionInfo info = pLogPositionInfoSource->lastKnownPosition();

            QPointF pt(info.coordinate().longitude(), info.coordinate().latitude());
            setCoordinate(pt);
        }
    }
}

void MyPosition::setCoordinate(const QPointF &d)
{
    if (m_coordinate == d)
        return;

    m_coordinate = d;
    emit coordinateChanged();
}
QPointF MyPosition::coordinate() const
{
    return m_coordinate;
}

void MyPosition::setValid(const bool &b)
{
    if (m_valid == b)
        return;

    m_valid = b;
    emit validChanged();
}
bool MyPosition::valid() const
{
    return m_valid;
}

void MyPosition::setSimulate(const bool &b)
{
    m_simulate = b;
}

void MyPosition::PositioningUpdate(const QGeoPositionInfo &info)
{
    //qDebug() << "Position updated:" << info;
    QPointF pt(info.coordinate().longitude(), info.coordinate().latitude());

    setCoordinate(pt);
    setValid(info.isValid());
}

void MyPosition::PositioningError(QGeoPositionInfoSource::Error positioningError)
{
    switch(positioningError)
    {
    case QGeoPositionInfoSource::AccessError:
        emit PositioningErrorString("GPS has no system access");
        break;
    case QGeoPositionInfoSource::ClosedError:
        emit PositioningErrorString("GPS has closed");
        break;
    case QGeoPositionInfoSource::UnknownSourceError:
        emit PositioningErrorString("unidentified error on GPS");
        break;
    case QGeoPositionInfoSource::NoError:
        break; // do nothing
    }
}
