#include "Window.h"
#include <QQmlContext>
#include "UIBridge.h"

Window::Window(QObject *parent)
    : QObject(parent)
{

}

void Window::init()
{
    connect(&m_bridge, &UIBridge::hmiEvent, this, &Window::handleHMIEvent);

    m_engine.rootContext()->setContextProperty("UIBridge", &m_bridge);
    m_engine.load(QStringLiteral("qrc:/main.qml"));
    m_appContainer = m_engine.rootObjects().first()->findChild<QObject*>("appContainer");

    showScreen("qrc:/screen_1.qml");
}

void Window::showScreen(QString screenUrl)
{
    m_appContainer->setProperty("source", screenUrl);
}

void Window::handleHMIEvent(int eventid)
{
    switch (eventid) {
    case 1:
        showScreen("qrc:/screen_1.qml");
        break;
    case 2:
        showScreen("qrc:/screen_2.qml");
        break;
    default: break;
    }
}
