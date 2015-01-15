#ifndef TIMESTAMP_H
#define TIMESTAMP_H

#include <QObject>
#include <QDate>
#include <QDateTime>
#include <String>

class TimeStamp : public QObject
{
    Q_OBJECT
public:
    explicit TimeStamp(QObject *parent = 0);
    ~TimeStamp();
    Q_INVOKABLE QString date(QDateTime expirationDate);
    Q_INVOKABLE int minutesUntilExp(QDateTime expirationDate);

signals:

public slots:
};

#endif // TIMESTAMP_H
