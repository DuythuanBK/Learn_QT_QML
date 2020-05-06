#include "roleentrymodel.h"


RoleEntryModel::RoleEntryModel(QObject *parent) : QAbstractListModel(parent)
{
    // set names to the role name hash container (QHash<int, QbyteArray)
    // model.name, model.hue ...
    m_roleNames[NameRole] = "name";
    m_roleNames[HueRole] = "hue";
    m_roleNames[SaturationRole] = "saturation";
    m_roleNames[BrightnessRole] = "brightness";

    // Append the color names as QColor to the data list (QList<QColor>)
    for (const QString& name : QColor::colorNames())
    {
        m_data.append(QColor(name));
    }
}

RoleEntryModel::~RoleEntryModel()
{

}

int RoleEntryModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant RoleEntryModel::data(const QModelIndex &index, int role) const
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

QHash<int, QByteArray> RoleEntryModel::roleNames() const
{
    return m_roleNames;
}
