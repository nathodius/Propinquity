#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "user.h"
#include "login.h"
#include "currentissue.h"
#include "timestamp.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<User>("cppClasses", 1, 0, "User");
    qmlRegisterType<Login>("cppClasses", 1, 0, "Login");
    qmlRegisterType<CurrentIssue>("cppClasses", 1, 0, "CurrentIssue");
    qmlRegisterType<TimeStamp>("cppClasses", 1, 0, "TimeStamp");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
