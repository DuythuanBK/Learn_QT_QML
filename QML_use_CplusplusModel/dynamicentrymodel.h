#ifndef DYNAMICENTRYMODEL_H
#define DYNAMICENTRYMODEL_H
#include <QtCore>
#include <QtGui>

class DynamicEntryModel : public QAbstractListModel
{
    Q_OBJECT

    // gives the size of the model
    Q_PROPERTY(int count READ count NOTIFY countChanged)
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

    Q_INVOKABLE void insert(int index, const QString& colorValue);
    Q_INVOKABLE void append(const QString& colorValur);
    Q_INVOKABLE void remove(int index);
    // clear the whole model
    Q_INVOKABLE void clear();

    // get a color at the index
    Q_INVOKABLE QColor get(int arg);


signals:
    void countChanged(int count);

public: // interface QAbtractListModel
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data (const QModelIndex &index, int role) const;
    int count () const;

protected: //interface QAbtractListModel
    // return the roles mapping to be used be QML
    virtual QHash<int, QByteArray> roleNames() const;

private:
    QList<QColor> m_data;
    QHash<int, QByteArray> m_roleNames;
    int m_count;

};

#endif // DYNAMICENTRYMODEL_H
