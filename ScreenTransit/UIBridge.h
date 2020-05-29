#ifndef UIBridge_H
#define UIBridge_H

#include <QObject>
#include <QQmlApplicationEngine>

class UIBridge : public QObject
{
    Q_OBJECT

public:
    UIBridge(QObject *parent = nullptr);

signals:
    void hmiEvent(int eventid);

};

#endif // WINDOW_H
