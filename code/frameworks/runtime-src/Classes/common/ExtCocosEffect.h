#ifndef __CCOCOSEFFECT_H_
#define __CCOCOSEFFECT_H_

#include "cocos2d.h"
#include "cocostudio/ActionTimeline/CCActionTimeline.h"



class ExtCocosEffect : public cocos2d::Node {
public:

    static ExtCocosEffect *create();

    virtual bool init();

    void setLastFrameCallBack(int id);

    bool loadCsd(const char *res);

    void play(bool isloop = false);

    void play(const char *actionName, bool isloop = false);

    void timelineCallback();

    void removeFromParant();


    ExtCocosEffect();

    ~ExtCocosEffect();

private:
    std::vector<std::string> m_allPlists;
    cocostudio::timeline::ActionTimeline *m_timeline;

    int m_callbackId = 0;
};

#endif
