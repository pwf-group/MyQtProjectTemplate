#ifndef EVENTDETAILS_H
#define EVENTDETAILS_H

#include <QObject>

class EventDetails : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString eventName READ eventName WRITE setEventName NOTIFY eventNameChanged)
    Q_PROPERTY(QString venue READ venue WRITE setVenue NOTIFY venueChanged)
    Q_PROPERTY(bool isPublished READ isPublished WRITE setIsPublished NOTIFY isPublishedChanged)
public:
    explicit EventDetails(QObject *parent = 0);
    ~EventDetails();

    QString description() const;
    void setDescription(QString value);

    QString eventName() const;
    void setEventName(QString value);

    QString venue() const;
    void setVenue(QString value);

    bool isPublished() const;
    void setIsPublished(bool value);

private:
    QString m_description;
    QString m_eventName;
    QString m_vanue;
    bool    m_isPublished;

signals:
    void descriptionChanged();
    void eventNameChanged();
    void venueChanged();
    void isPublishedChanged();

public slots:
};

#endif // EVENTDETAILS_H
