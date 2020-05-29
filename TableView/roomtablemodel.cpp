#include "roomtablemodel.h"
#include <QtDebug>

RoomTableModel::RoomTableModel(QObject *parent) : QAbstractTableModel(parent)
{
    m_roleNames[RoomTextRole] = "room";
    m_roomTable.append({"201", "202", "203"});
    m_roomTable.append({"301", "302", "303"});
    m_roomTable.append({"401", "402", "403"});

}

int RoomTableModel::rowCount(const QModelIndex &) const
{
    qDebug() << "row count: " << m_roomTable.size();
    return m_roomTable.size();
}

int RoomTableModel::columnCount(const QModelIndex &) const
{
    qDebug() << "column count: " << m_roleNames[0].size();
    return m_roomTable.at(0).size();
}

QVariant RoomTableModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case RoomTextRole:
        qDebug() << "Room: " <<  m_roomTable[index.row()][index.column()];
        return m_roomTable[index.row()][index.column()];

    default:
        break;
    }

    return QVariant();
}

QHash<int, QByteArray> RoomTableModel::roleNames() const
{
    return m_roleNames;
}
