#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>

class Login : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString email MEMBER m_email)
    Q_PROPERTY(QString password MEMBER m_password)
    Q_PROPERTY(int numTries MEMBER m_numTries)
public:
    explicit Login(QObject *parent = 0);
    ~Login();

private:
    QString m_email;
    QString m_password;
    int m_numTries;

signals:

public slots:
};

#endif // LOGIN_H
