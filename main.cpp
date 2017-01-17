#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QQmlEngine>
#include "GEvent.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    Gevent* event = new Gevent;
    qmlRegisterType<Gevent> ("my.Gevent",1,0,"Gevent");
    QQmlApplicationEngine* view = new QQmlApplicationEngine;
    QQmlContext* context = view->rootContext();
    context->setContextProperty("myEvent",event);

    view->load(QUrl(QStringLiteral("qrc:/main.qml")));
    //QQmlApplicationEngine engine;
    //engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
