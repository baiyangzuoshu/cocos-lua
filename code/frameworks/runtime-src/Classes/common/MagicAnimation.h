#ifndef __MAGIC_ANIMATION_H__
#define __MAGIC_ANIMATION_H__

#include "cocos2d.h"
#include <unordered_set>



class MagicAnimation : public cocos2d::Sprite {
public:
    static MagicAnimation *create();

    MagicAnimation();

    ~MagicAnimation();

    void createMagic(const char *name, float delay = 0.1, bool loop = false);

    bool pustFrameTexture(std::string file);

    virtual void draw(cocos2d::Renderer *renderer, const cocos2d::Mat4 &transform, uint32_t flags) override;

protected:
    void changeToNextFrame();

    void initSpriteFrameList(const char *name);

    void clearPlistCache();

private:
    cocos2d::Vector<cocos2d::SpriteFrame *> mSpriteFrameList;
    int mFrameIndex = 0;

    float mDelayCount = 0;

    float mInterval = 0.12;

    bool mLoop = false;

    std::unordered_set<std::string> mPlistList;

    std::string mAnimationName = "";
};

#endif
