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

MyPosition *MyPosition::instance_ = 0;

MyPosition::MyPosition(QObject *parent) :
    QObject(parent)
{
    m_coordinate = QGeoCoordinate(0,0);
    m_valid      = false;
    m_simulate   = true;
    m_interval   = 3000;
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
                qDebug() << "connect position updated...";
                connect(pGeoPositionInfoSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                        this, SLOT(PositioningUpdate(QGeoPositionInfo)));
                connect(pGeoPositionInfoSource, SIGNAL(error(QGeoPositionInfoSource::Error)),
                        this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));

                qDebug() << "start position update...";
                pGeoPositionInfoSource->setUpdateInterval(m_interval);
                pGeoPositionInfoSource->startUpdates();

                QGeoPositionInfo info = pGeoPositionInfoSource->lastKnownPosition();
                setCoordinate(info.coordinate());
            }
        }
    }
    else
    {
        if(pLogPositionInfoSource == NULL)
        {
            pLogPositionInfoSource = new LogFilePositionSource;

            qDebug() << "connect position updated...";
            connect(pLogPositionInfoSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                    this, SLOT(PositioningUpdate(QGeoPositionInfo)));
            connect(pLogPositionInfoSource, SIGNAL(error(QGeoPositionInfoSource::Error)),
                    this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));

            qDebug() << "start position update using log file...";
            pLogPositionInfoSource->setUpdateInterval(m_interval);
            pLogPositionInfoSource->startUpdates();

            QGeoPositionInfo info = pLogPositionInfoSource->lastKnownPosition();
            setCoordinate(info.coordinate());
        }
    }
}
void MyPosition::stopPositioning()
{
    if(m_simulate == false)
    {
        if(pGeoPositionInfoSource != NULL)
        {
            pGeoPositionInfoSource->stopUpdates();

            qDebug() << "disconnect position updated...";
            disconnect(this, SLOT(PositioningUpdate(QGeoPositionInfo)));
            disconnect(this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));
        }
    }
    else
    {
        if(pLogPositionInfoSource != NULL)
        {
            pLogPositionInfoSource->stopUpdates();

            qDebug() << "disconnect positionUpdated...";
            disconnect(this, SLOT(PositioningUpdate(QGeoPositionInfo)));
            disconnect(this, SLOT(PositioningError(QGeoPositionInfoSource::Error)));
        }
    }

    setCoordinate(QGeoCoordinate(0,0));
}

void MyPosition::setCoordinate(const QGeoCoordinate &d)
{
    if (m_coordinate == d)
        return;

    m_coordinate = d;
    emit coordinateChanged();
}
QGeoCoordinate MyPosition::coordinate() const
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

void MyPosition::setInterval(const int &msec)
{
    m_interval = msec;
}

void MyPosition::PositioningUpdate(const QGeoPositionInfo &info)
{
    //qDebug() << "Position updated:" << info;
    setCoordinate(info.coordinate());
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
