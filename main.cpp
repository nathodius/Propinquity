#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "user.h"
#include "login.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<User>("cppClasses", 1, 0, "User");
    qmlRegisterType<Login>("cppClasses", 1, 0, "Login");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
