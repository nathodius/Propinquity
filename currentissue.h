#ifndef CURRENTISSUE_H
#define CURRENTISSUE_H

#include <QObject>
#include <QString>

class CurrentIssue : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id MEMBER m_id NOTIFY idChanged)
    Q_PROPERTY(QString feed MEMBER m_feed NOTIFY feedChanged)
public:
    explicit CurrentIssue(QObject *parent = 0);
    ~CurrentIssue();
private:
    QString m_id;
    QString m_feed;

signals:
    void idChanged();
    void feedChanged();

public slots:
};

#endif // CURRENTISSUE_H
