#ifndef ATTENDEESMODEL_H
#define ATTENDEESMODEL_H

#include <QAbstractListModel>

class Attendance
{
public:
    QString name;
    QString chineseName;
    QString group;
    int tableNumber;
    int numberOfPax;
};

class AttendeesModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit AttendeesModel(QObject *parent = 0);
    ~AttendeesModel();

    enum AttendeesRoles {
        kNameRole = Qt::UserRole + 1,
        kChineseNameRole,
        kGroupRole,
        kTableNumberRole,
        kNumberOfPaxRole,
        kColumnMaximum
    };

    int rowCount(const QModelIndex & parent = QModelIndex()) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex & index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    void add(Attendance *attendance);
    void empty();

    void addSource(Attendance *attendance);
    void emptySource();

    Q_INVOKABLE QStringList tableModel();
    Q_INVOKABLE void filterText(QString text);
    Q_INVOKABLE void filterTable(QString table);

private:
    QList<Attendance*> m_attendanceList;
    QList<Attendance*> m_attendanceSource;

    QStringList        m_tableModel;

signals:

public slots:
};

#endif // ATTENDEESMODEL_H
