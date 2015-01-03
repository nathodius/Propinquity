#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "user.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<User>("cppClasses", 1, 0, "User");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
