#ifndef WINDOW_H
#define WINDOW_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "UIBridge.h"

class Window : public QObject
{
    Q_OBJECT

public:
    Window(QObject *parent = nullptr);

    void init();
    void showScreen(QString screenUrl);

private slots:
    void handleHMIEvent(int eventid);

private:
    QQmlApplicationEngine m_engine;
    UIBridge m_bridge;
    QObject *m_appContainer = nullptr;
    QObject *m_overlayContainer = nullptr;

};

#endif // WINDOW_H
