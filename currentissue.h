#ifndef CURRENTISSUE_H
#define CURRENTISSUE_H

#include <QObject>
#include <QString>
#include <QDebug>

class CurrentIssue : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id MEMBER m_id NOTIFY idChanged)
    Q_PROPERTY(int feed MEMBER m_feed NOTIFY feedChanged)
public:
    explicit CurrentIssue(QObject *parent = 0);
    ~CurrentIssue();
    Q_INVOKABLE QString findFeed();
private:
    QString m_id;
    int m_feed;

signals:
    void idChanged();
    void feedChanged();

public slots:
};

#endif // CURRENTISSUE_H
