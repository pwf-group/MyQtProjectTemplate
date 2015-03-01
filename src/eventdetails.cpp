#include "eventdetails.h"

EventDetails::EventDetails(QObject *parent) : QObject(parent)
{

}

EventDetails::~EventDetails()
{

}


QString EventDetails::description() const
{
    return m_description;
}
void EventDetails::setDescription(QString value)
{
    m_description = value;
    emit descriptionChanged();
}

QString EventDetails::eventName() const
{
    return m_eventName;
}
void EventDetails::setEventName(QString value)
{
    m_eventName = value;
    emit eventNameChanged();
}

QString EventDetails::venue() const
{
    return m_vanue;
}
void EventDetails::setVenue(QString value)
{
    m_vanue = value;
    emit venueChanged();
}

bool EventDetails::isPublished() const
{
    return m_isPublished;
}
void EventDetails::setIsPublished(bool value)
{
    m_isPublished = value;
    emit isPublishedChanged();
}
