#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dataentrymodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // register the type DataEntryModel
    // under the url "org.example" in version 1.0
    // under the name "DataEntryModel
    qmlRegisterType<DataEntryModel>("org.example", 1, 0, "DataEntryModel");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
