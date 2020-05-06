#ifndef DYNAMICENTRYMODEL_H
#define DYNAMICENTRYMODEL_H
#include <QtCore>
#include <QtGui>

class DynamicEntryModel : public QAbstractListModel
{
public:
    Q_INVOKABLE void insert(int index, const QString& colorValue);
    Q_INVOKABLE void append(const QString& colorValur);
    Q_INVOKABLE void remove(int index);
    // clear the whole model
    Q_INVOKABLE void clear();
    // gives the size of the model
    Q_PROPERTY(int count READ count NOTIFY countChanged)

    // get a color at the index
    Q_INVOKABLE QColor get(int index);

signals:
    void countChanged(int count);
public:
    explicit DynamicEntryModel(QObject *parent = 0);
    ~DynamicEntryModel();

    // Define the role names to be used
    enum RoleNames {
        NameRole = Qt::UserRole,
        HueRole = Qt::UserRole + 2,
        SaturationRole = Qt::UserRole + 3,
        BrightnessRole = Qt::UserRole+4
    };
    virtual int count () const;
public:
    virtual QVariant data (const QModelIndex &index, int role) const override;
protected:
    // return the roles mapping to be used be QML
    virtual QHash<int, QByteArray> roleNames() const override;
private:
    QList<QColor> m_data;
    QHash<int, QByteArray> m_roleNames;

};

#endif // DYNAMICENTRYMODEL_H
