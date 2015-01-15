#include "user.h"
#include <QDebug>

User::User(QObject *parent) : QObject(parent)
{

}

User::~User()
{

}

bool User::addToTracking(QString id) {
    bool temp;
    if (m_tracking.contains(id))
    {
        m_tracking.removeOne(id);
        temp = true;
    }
    else
       {
        m_tracking.append(id);
        temp = false;
    }
    //m_tracking = !m_tracking;
    qDebug() << m_tracking;
    return temp;
}

