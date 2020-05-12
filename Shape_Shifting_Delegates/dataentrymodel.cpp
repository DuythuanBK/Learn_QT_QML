#include "dataentrymodel.h"

DataEntryModel::DataEntryModel(QObject *parent) : QAbstractListModel(parent)
{
    m_data = QColor::colorNames();
}

DataEntryModel::~DataEntryModel()
{

}

int DataEntryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    return m_data.count();
}

QVariant DataEntryModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();

    // boundary check for the row
    if(row < 0 && row > m_data.count())
    {
        return QVariant();
    }
    // A model can return  data for different role.
    // The default role is the display role
    // it can be accesses in QML with "model.display"
    switch(role)
    {
        case Qt::DisplayRole:
            return m_data.value(row);
    }

    return QVariant();
}
