#pragma once

#include "cocos2d.h"

USING_NS_CC;

class GlobleUpdate : public Ref {
public:
    static GlobleUpdate *instance();

    void update(float dt);

    void registerScheduler();

    ~GlobleUpdate();

private:
    GlobleUpdate();

private:

    Scheduler *_scheduler;          ///< scheduler used to schedule timers and updates

    int time = 0;
};