#ifndef __LAYER_CUSTOM_H__
#define __LAYER_CUSTOM_H__

#include "cocos2d.h"
#include <unordered_set>

class LayerCustom : public cocos2d::Layer {
public:
    LayerCustom();

    virtual ~LayerCustom();

    static LayerCustom *create();

    void initPlistList(const char *plistList);

    void appendPlist(const char *path);

private:
    std::unordered_set<std::string> mPlistList;
};

#endif
