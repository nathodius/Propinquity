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
    //Q_PROPERTY(bool backToFeed MEMBER m_backToFeed NOTIFY backToFeedChanged)
public:
    explicit CurrentIssue(QObject *parent = 0);
    ~CurrentIssue();
    Q_INVOKABLE QString findFeed();
    Q_INVOKABLE QString findFeedSource();
private:
    QString m_id;
    int m_feed;
    //bool m_backToFeed;

signals:
    void idChanged();
    void feedChanged();
    void backToFeedChanged();

public slots:
};

#endif // CURRENTISSUE_H
