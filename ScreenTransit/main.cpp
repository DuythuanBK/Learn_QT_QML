#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Window.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    Window window;
    window.init();

    return app.exec();
}
