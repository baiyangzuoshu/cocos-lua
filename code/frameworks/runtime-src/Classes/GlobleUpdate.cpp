#include "GlobleUpdate.h"

#include "LuaSystemCall.h"
#include "common/IAgoraMessageManage.hpp"
//#include "common/IAgoraRoomManager.h"
//#include "MessageDispatcher.h"

GlobleUpdate *GlobleUpdate::instance() {
    static GlobleUpdate _GlobleUpdate;
    return &_GlobleUpdate;
}

void GlobleUpdate::update(float dt) {
    g_LuaSystemCall->CallLuaFunc("GAMEGLOABLEUPDATE", dt);
    AgoraMessageManage::instance()->oneMessageNeedHandle();
    AgoraMessageManage::instance()->checkOneEvent();
    //std::string str ;//= IAgoraRoomManager::instance()->getOneVoiceChange();
   // if (str.length()>0) {
//        MessageDispatcher::getInstance()->callLuaFunction("app/native/IAgoraCallBackHandler.lua", "onAudioVolumeIndication", 1, 0, str.c_str(), str.length());
   // }
    
}

void GlobleUpdate::registerScheduler() {
    _scheduler->setGlobleScheduleUpdate(this);
}

GlobleUpdate::~GlobleUpdate() {
}

GlobleUpdate::GlobleUpdate() {
    auto _director = Director::getInstance();

    _scheduler = _director->getScheduler();
    _scheduler->retain();
}
