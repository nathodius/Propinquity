#include "timestamp.h"

TimeStamp::TimeStamp(QObject *parent) : QObject(parent)
{

}

TimeStamp::~TimeStamp()
{

}

QString TimeStamp::date(QDateTime expirationDate)
{
    int secs = QDateTime::currentDateTime().secsTo(expirationDate);
    int minutes = secs / 60;
    secs = secs % 60;
    int hours = minutes / 60;
    minutes = minutes % 60;
    int days = hours / 24;
    hours = hours % 24;

    QString hoursString;
    QString minutesString;
    QString daysString;
    bool hoursStringSet = false;
    bool minutesStringSet = false;
    bool daysStringSet = false;



    for (int i=0; i<10; i++) {
        if (minutes == i) {
            minutesString = "0" + QString::number(minutes);
            minutesStringSet = true;

        }
        if (hours == i) {
            hoursString = "0" + QString::number(hours);
            hoursStringSet = true;

        }
        if (days == i) {
            daysString = "0" + QString::number(days);
            daysStringSet = true;
        }
    }

    if (!minutesStringSet){
        minutesString = QString::number(minutes);
    }
    if (!hoursStringSet){
        hoursString = QString::number(hours);
    }
    if (!daysStringSet){
        daysString = QString::number(days);
    }

    return (daysString + ":" + hoursString + ":" + minutesString);

}

int TimeStamp::minutesUntilExp(QDateTime expirationDate) {
    int secs = QDateTime::currentDateTime().secsTo(expirationDate);
    int minutes = secs / 60;
    return minutes;
}

