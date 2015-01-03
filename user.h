#ifndef USER_H
#define USER_H

#include <QObject>
#include <QString>

class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email MEMBER m_email)
    /*Q_PROPERTY(QString password MEMBER m_password)
    Q_PROPERTY(QString name MEMBER m_name)
    Q_PROPERTY(QString gender MEMBER m_gender)
    Q_PROPERTY(QString age MEMBER m_age)
    Q_PROPERTY(QString ethnicity MEMBER m_ethnicity)*/
public:
    explicit User(QObject *parent = 0);
    ~User();

private:
    QString m_email;
    QString m_password;
    QString m_name;
    QString m_gender;
    QString m_age;
    QString m_ethnicity;


signals:

public slots:
};

#endif // USER_H
