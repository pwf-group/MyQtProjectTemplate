#include "attendeesmodel.h"

#include <QQmlEngine>

AttendeesModel::AttendeesModel(QObject *parent)
    : QAbstractListModel(parent)
{
    QQmlEngine::setObjectOwnership(this, QQmlEngine::CppOwnership);
}

AttendeesModel::~AttendeesModel()
{

}

int AttendeesModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_attendanceList.count();
}

int AttendeesModel::columnCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return kColumnMaximum;
}

QVariant AttendeesModel::data(const QModelIndex & index, int role) const {
    const Attendance *attendance = m_attendanceList[index.row()];

    if (role == kNameRole)
        return attendance->name;
    else if (role == kChineseNameRole)
        return attendance->chineseName;
    else if (role == kGroupRole)
        return attendance->group;
    else if (role == kTableNumberRole)
        return attendance->tableNumber;
    else if (role == kNumberOfPaxRole)
        return attendance->numberOfPax;

    return QVariant();
}

QHash<int, QByteArray> AttendeesModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[kNameRole] = "name";
    roles[kChineseNameRole] = "chineseName";
    roles[kGroupRole] = "group";
    roles[kTableNumberRole] = "tableNumber";
    roles[kNumberOfPaxRole] = "numberOfPax";
    return roles;
}

void AttendeesModel::add(Attendance *attendance)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_attendanceList.append(attendance);
   // m_taskList << task;
    endInsertRows();
}

void AttendeesModel::empty()
{
    beginResetModel();
    m_attendanceList.clear();
    endResetModel();
}

void AttendeesModel::addSource(Attendance *attendance)
{
    add(attendance);
    m_attendanceSource.append(attendance);
}

void AttendeesModel::emptySource()
{
    empty();

    foreach(Attendance *attendance, m_attendanceSource)
        delete attendance;
    m_attendanceSource.clear();
}

void AttendeesModel::filterText(QString text)
{
    empty();
    foreach(Attendance *attendance, m_attendanceSource)
    {
        if(attendance->name.contains(text,Qt::CaseInsensitive))
            add(attendance);
        else if(attendance->chineseName.contains(text,Qt::CaseInsensitive))
            add(attendance);
        else if(attendance->group.contains(text,Qt::CaseInsensitive))
            add(attendance);
    }
}

void AttendeesModel::filterTable(QString table)
{
    empty();
    foreach(Attendance *attendance, m_attendanceSource)
        if(attendance->tableNumber == table.toInt())
            add(attendance);
}
