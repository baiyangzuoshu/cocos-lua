#include "cEntity.h"

USING_NS_CC;

cEntity::~cEntity() {

}

bool cEntity::pustFrameTexture(std::string file) {
    CCASSERT(!file.empty(), "Invalid spriteFrameName");
    if (file.empty()) {
        return false;
    }

    _fileName = file;
    _fileType = 1;

    SpriteFrame *frame = SpriteFrameCache::getInstance()->getSpriteFrameByName(file);
    if (frame == nullptr) {
        this->runAction(Sequence::create(DelayTime::create(0.001f), CallFunc::create([=]() {
            this->pustFrameTexture(_fileName);

        }), nullptr));
        //spriteFrame = SpriteFrameCache::getInstance()->getSpriteFrameByName("0_0_temporary/KaidePet.png");
    } else {
        if (frame) {
            _spriteFrameList.pushBack(frame);
        }
    }


    return true;
}

void cEntity::changeToNextFrame() {
    if (_spriteFrameList.size() <= 1) {
        return;
    }
    m_frameIndex++;
    if (m_frameIndex < _spriteFrameList.size()) {
        //initWithSpriteFrame(_spriteFrameList.at(m_frameIndex));
    } else {
        m_frameIndex = 0;

    }
    initWithSpriteFrame(_spriteFrameList.at(m_frameIndex));

}

void cEntity::draw(Renderer *renderer, const Mat4 &transform, uint32_t flags) {
    float delatime = Director::getInstance()->getDeltaTime();

    m_betweenFrameTime += delatime;
    if (m_betweenFrameTime > m_setBetweenFrameTime) {
        m_betweenFrameTime = 0;
        changeToNextFrame();
    }
    cocos2d::CCSprite::draw(renderer, transform, flags);


}

cEntity::cEntity() {

}

