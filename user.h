#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>
#include <QStringList>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email MEMBER m_email)
    Q_PROPERTY(QString password MEMBER m_password)
    Q_PROPERTY(QString password_reEnter MEMBER m_password_reEnter)
    Q_PROPERTY(QString gender MEMBER m_gender)
    Q_PROPERTY(QString age MEMBER m_age)
    Q_PROPERTY(QString ethnicity MEMBER m_ethnicity)
    Q_PROPERTY(QString income MEMBER m_income)
    Q_PROPERTY(QStringList tracking MEMBER m_tracking NOTIFY trackingUpdated)
public:
    explicit User(QObject *parent = 0);
    ~User();
    Q_INVOKABLE bool addToTracking(QString id);

private:
    QString m_email;
    QString m_password;
    QString m_password_reEnter;
    QString m_name;
    QString m_gender;
    QString m_age;
    QString m_ethnicity;
    QString m_income;
    QStringList m_tracking;


signals:
    void trackingUpdated();

public slots:
};

#endif // USER_H
