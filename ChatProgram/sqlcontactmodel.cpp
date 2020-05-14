#include "sqlcontactmodel.h"
#include <QSqlError>
#include <QSqlQuery>
#include <QDebug>
static void createTable()
{
    if(QSqlDatabase::database().tables().contains(QStringLiteral("Contacts")))
    {
        // The table already exist; we don't need to do anything.
        qDebug() << "Check table contacts";
        return;
    }

    QSqlQuery query;
    if(!query.exec("CREATE TABLE IF NOT EXISTS 'Contacts' ("
                "'name' TEXT NOT NULL, "
                "PRIMARY KEY(name)"
                ")"))
    {
        qDebug() << "Create table";
        qFatal("Failed to query database: %s", qPrintable(query.lastError().text()));
    }
    query.exec("INSERT INTO Contacts VALUES('Albert Einstein')");
    query.exec("INSERT INTO Contacts VALUES('Ernest Hemingway')");
    query.exec("INSERT INTO Contacts VALUES('Hans Gude')");
}

SqlContactModel::SqlContactModel(QObject* parent) : QSqlQueryModel(parent)
{
    createTable();

    QSqlQuery query;
    if(!query.exec("SELECT * FROM Contacts"))
        qFatal("Contacts SELECT query failed: %s", qPrintable(query.lastError().text()));

    setQuery(query);
    if(lastError().isValid())
        qFatal("Cannot set query on SqlContactModel: %s", qPrintable(lastError().text()));

}

