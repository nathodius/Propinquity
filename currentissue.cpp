#include "currentissue.h"

CurrentIssue::CurrentIssue(QObject *parent) : QObject(parent)
{
    m_feed = 0;
}

CurrentIssue::~CurrentIssue()
{

}

QString CurrentIssue::findFeed()
{
    switch (m_feed) {
       case 0: return "objects.trackingFeed";
                //break;
       case 1: return "objects.localFeed";
       case 2: return "objects.stateFeed";
       case 3: return "objects.federalFeed";
       default: return "objects.trackingFeed";
    }
}

QString CurrentIssue::findFeedSource()
{
    switch (m_feed) {
       case 0: return "TrackingFeed.qml";
                //break;
       case 1: return "LocalFeed.qml";
       case 2: return "StateFeed.qml";
       case 3: return "FederalFeed.qml";
       default: return "TrackingFeed.qml";
    }
}

