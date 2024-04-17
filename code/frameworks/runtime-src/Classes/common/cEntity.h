#ifndef __CENTITY_H__
#define __CENTITY_H__

#include "cocos2d.h"



class cEntity : public cocos2d::Sprite {
public:


    ~cEntity();

    cEntity();

    bool pustFrameTexture(std::string file);

    virtual void draw(cocos2d::Renderer *renderer, const cocos2d::Mat4 &transform, uint32_t flags) override;

protected:


    virtual void changeToNextFrame();

protected:
    cocos2d::Vector<cocos2d::SpriteFrame *> _spriteFrameList;
    int m_frameIndex = 0;

    float m_betweenFrameTime = 0;

    float m_setBetweenFrameTime = 0.12; //���õ�ÿһ֮֡��ļ��
};

#endif
