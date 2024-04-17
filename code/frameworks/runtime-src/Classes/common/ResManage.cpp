#include "ResManage.h"
#include "LuaSystemCall.h"
#include "Utils.h"


USING_NS_CC;

ResManage::~ResManage() {
}

ResManage *ResManage::instance() {
    static ResManage _resManage;
    return &_resManage;
}

void ResManage::loadPlistRes(std::string path) {
    CCSpriteFrameCache::sharedSpriteFrameCache()->loadPlistRes(path);
}

void ResManage::unLoadPlistRes(std::string path) {
    CCSpriteFrameCache::sharedSpriteFrameCache()->unLoadPlistRes(path);
}


void ResManage::loadTextureAsync(const char *_paths, int luaCallbck) {
    std::vector<std::string> paths = s_split(_paths, "|");
    this->count = 0;
    this->total = paths.size();
    this->mLuaCallback = luaCallbck;

    for (int idx = 0; idx < total; idx++) {
        const char *path = paths.at(idx).c_str();
        CCLOG("asynLoadTexture PATH idx=%d : %s", idx, path);
        Director::getInstance()->getTextureCache()->addImageAsync(path, [=](cocos2d::Texture2D *_texture) {
            this->callback(_texture);
        });
    }
}

void ResManage::callback(CCObject *pSender) {
    this->count++;
    CCLOG("asyn load res completed..");
    if (this->mLuaCallback && this->mLuaCallback > 0) {
        g_LuaSystemCall->luaCallBack(this->mLuaCallback);
    }
}

ResManage::ResManage() : mLuaCallback(0), count(0), total(0) {
}
