#include "dynamicentrymodel.h"

DynamicEntryModel::DynamicEntryModel(QObject *parent) :QAbstractListModel(parent)
{
    // Set names to the role name hash container (QHash<int, QByteArray>)
    // model.name, model.hue, model.saturation, model.brightness
    m_roleNames[NameRole] = "name";
    m_roleNames[HueRole] = "hue";
    m_roleNames[SaturationRole] = "saturation";
    m_roleNames[BrightnessRole] = "brightness";
}

DynamicEntryModel::~DynamicEntryModel()
{

}

int DynamicEntryModel::count() const
{
    return m_data.count();
}

QVariant DynamicEntryModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if(row < 0 && row >= m_data.count())
    {
        return QVariant();
    }

    const QColor& color = m_data.at(row);
    qDebug() << row << role << color;

    switch(role)
    {
        case NameRole:
            // return the color name as hex string (model.name)
            return color.name();
        case HueRole:
            // return the hue of the color (model.hue)
            return color.hueF();
        case SaturationRole:
            return color.saturation();
        case BrightnessRole:
            return color.lightness();

    }
    return QVariant();
}

void DynamicEntryModel::insert(int index, const QString &colorValue)
{
    if(index < 0 || index > m_data.count()) {
        return;
    }
    QColor color(colorValue);
    if(!color.isValid())
    {
        return;
    }

    // view protocol (begin => mainpulate => end
    emit beginInsertRows(QModelIndex(), index, index);
    m_data.insert(index, color);
    emit endInsertRows();
    // update our count property
    emit countChanged(m_data.count());
}

void DynamicEntryModel::append(const QString &colorValue)
{
    insert(count(), colorValue);
}

void DynamicEntryModel::remove(int index)
{
    if(index < 0 || index > m_data.count())
    {
        return;
    }
    // view protocol (begin => mainpulate => end
    emit beginInsertRows(QModelIndex(), index, index);
    m_data.removeAt(index);
    emit endInsertRows();
    // update our count property
    emit countChanged(m_data.count());
}

QColor DynamicEntryModel::get(int index)
{
    if(index < 0 || index >= m_data.count())
    {
        return QColor();
    }

    return m_data.at(index);
}

