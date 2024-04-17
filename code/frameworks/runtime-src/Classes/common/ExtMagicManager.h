#ifndef __EXTMAGICMANAGER_H__
#define __EXTMAGICMANAGER_H__

#include "cMagic.h"

class ExtMagicManager {
public:

    static ExtMagicManager *instance();

    cMagic *creatMagic(const char *res, float delay = 0.2, bool isloop = false);


    void onUpdate(float dt);

    ~ExtMagicManager();

private:
    ExtMagicManager();

private:

    cocos2d::Vector<cMagic *> _magics;


};

#endif
