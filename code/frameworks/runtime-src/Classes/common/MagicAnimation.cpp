#include "MagicAnimation.h"

#include "common/ResManage.h"
USING_NS_CC;
MagicAnimation *MagicAnimation::create() {
    MagicAnimation *magic = new(std::nothrow) MagicAnimation();
    if (magic && magic->init()) {
        magic->autorelease();
        return magic;
    }
    CC_SAFE_DELETE(magic);
    return nullptr;
}

MagicAnimation::MagicAnimation() {

}

MagicAnimation::~MagicAnimation() {
    clearPlistCache();
}

void MagicAnimation::createMagic(const char *name, float delay, bool loop) {
    mInterval = delay;
    mLoop = loop;
    mFrameIndex = 0;
    mDelayCount = 0;

    if (mAnimationName != name) {
        initSpriteFrameList(name);
    }

    if (!mSpriteFrameList.empty()) {
        initWithSpriteFrame(mSpriteFrameList.at(mFrameIndex));
        setVisible(true);
    }
}


bool MagicAnimation::pustFrameTexture(std::string file) {
    CCASSERT(!file.empty(), "Invalid spriteFrameName");
    if (file.empty()) {
        return false;
    }

    _fileName = file;
    _fileType = 1;

    SpriteFrame *frame = SpriteFrameCache::getInstance()->getSpriteFrameByName(file);
    if (frame) {
        mSpriteFrameList.pushBack(frame);
    }

    return true;
}

void MagicAnimation::draw(Renderer *renderer, const Mat4 &transform, uint32_t flags) {
    float delatime = Director::getInstance()->getDeltaTime();

    mDelayCount += delatime;
    if (mDelayCount > mInterval) {
        mDelayCount = 0;
        changeToNextFrame();
    }
    cocos2d::CCSprite::draw(renderer, transform, flags);
}

void MagicAnimation::changeToNextFrame() {
    if (mSpriteFrameList.size() <= 1) {
        return;
    }

    bool flag = true;

    mFrameIndex++;
    if (mFrameIndex >= mSpriteFrameList.size()) {
        if (mLoop) {
            mFrameIndex = 0;
        } else {
            flag = false;
        }
    }

    if (flag) {
        initWithSpriteFrame(mSpriteFrameList.at(mFrameIndex));
    }
    setVisible(flag);

}

void MagicAnimation::initSpriteFrameList(const char *name) {
    mSpriteFrameList.clear();
    clearPlistCache();

    mAnimationName = name;

    std::vector<ValueMap> list;
    for (int i = 1; i < 10; i++) {
        char path[256];
        sprintf(path, "art/Animation/%s/%s_%d.plist", name, name, i);

        if (!FileUtils::getInstance()->isFileExist(path)) {
            break;
        }

        if (!mPlistList.count(path)) {
            ResManage::instance()->loadPlistRes(path);
            mPlistList.insert(path);
        }

        std::string fullPath = FileUtils::getInstance()->fullPathForFilename(path);
        ValueMap dict = FileUtils::getInstance()->getValueMapFromFile(fullPath);
        if (dict.find("frames") != dict.end()) {
            list.push_back(dict["frames"].asValueMap());
        }
    }

    int len = 1;
    while (true) {
        char key[256];
        sprintf(key, "Animation/%s/%04d.png", name, len);

        bool flag = false;
        for (auto framesDict: list) {
            if (framesDict.count(key)) {
                flag = true;
                break;
            }
        }

        if (flag) {
            this->pustFrameTexture(key);
            len++;
        } else {
            break;
        }
    }
}

void MagicAnimation::clearPlistCache() {
    for (const auto &path: mPlistList) {
        ResManage::instance()->unLoadPlistRes(path);
    }
    mPlistList.clear();
}
