#ifndef ROOMTABLEMODEL_H
#define ROOMTABLEMODEL_H

#include <QAbstractTableModel>
#include <QObject>

#define COlUNM_MAX (3)

class RoomTableModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    enum RoleNames {
        RoomTextRole = Qt::UserRole
    };
public:
    explicit RoomTableModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<QVector<QString>> m_roomTable;
    QHash<int, QByteArray> m_roleNames;

};

#endif // ROOMTABLEMODEL_H
