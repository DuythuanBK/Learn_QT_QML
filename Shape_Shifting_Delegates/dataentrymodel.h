#ifndef DATAENTRYMODEL_H
#define DATAENTRYMODEL_H
#include <QtCore>
#include <QtGui>

class DataEntryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit DataEntryModel(QObject *parent = nullptr);
    ~DataEntryModel();

public:
    virtual int rowCount(const QModelIndex& parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;

signals:

public slots:

private:
    QList<QString> m_data;
};

#endif // DATAENTRYMODEL_H
