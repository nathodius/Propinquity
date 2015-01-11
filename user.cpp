#include "user.h"
#include <QDebug>

User::User(QObject *parent) : QObject(parent)
{

}

User::~User()
{

}

void User::addToTracking(QString id) {
    m_tracking.append(id);
    qDebug() << m_tracking;
}

