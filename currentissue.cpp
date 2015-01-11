#include "currentissue.h"

CurrentIssue::CurrentIssue(QObject *parent) : QObject(parent)
{

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
    }
}

