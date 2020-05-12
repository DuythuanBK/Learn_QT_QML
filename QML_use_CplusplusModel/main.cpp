#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "roleentrymodel.h"
#include "dynamicentrymodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // register the type DataEntryModel
    // under the url "org.example" in version 1.0
    // under the same "RoleEntryModel"
    qmlRegisterType<RoleEntryModel>("org.example", 1, 0, "RoleEntryModel");
    qmlRegisterType<DynamicEntryModel>("org.example", 1, 0, "DynamicEntryModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
