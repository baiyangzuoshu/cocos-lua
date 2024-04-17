//
//  IGamingRtcEngineEventHandler.cpp
//  letsroll-mobile
//
//  Created by 魏雨 on 2022/6/6.
//

#include "IGamingRtcEngineEventHandler.h"
#include "IAgoraMessageManage.hpp"
#include "IAgoraRoomManager.h"
//#include "MessageDispatcher.h"
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
void GameRtcEngineEventHandler::onError(int err, const char* msg)
{
    CCLOG("GameRtcEngineEventHandler::onError err=%d,msg=%s", err, msg);
}

void GameRtcEngineEventHandler::onUserJoined(uid_t uid, int elapsed)
{

}

void GameRtcEngineEventHandler::onUserOffline(uid_t uid, USER_OFFLINE_REASON_TYPE reason)
{

}

void GameRtcEngineEventHandler::onRejoinChannelSuccess(const char* channel, uid_t uid, int elapsed) {

	IAgoraRoomManager::instance()->isInroom = true;
	IAgoraRoomManager::instance()->isStartInRoom = true;
	IAgoraRoomManager::instance()->refrshVoice();
	AgoraMessageManage::instance()->joinRoomHandler((int)uid);
}

void GameRtcEngineEventHandler::onJoinChannelSuccess(const char* channel, uid_t uid, int elapsed){
    
    IAgoraRoomManager::instance()->isInroom=true;
    IAgoraRoomManager::instance()->isStartInRoom = true;
    IAgoraRoomManager::instance()->refrshVoice();
    AgoraMessageManage::instance()->joinRoomHandler((int)uid);
}

void GameRtcEngineEventHandler::onLeaveChannel(const agora::rtc::RtcStats& stats){
    IAgoraRoomManager::instance()->isInroom=false;
    IAgoraRoomManager::instance()->isStartLevelRoom = false;
    IAgoraRoomManager::instance()->refrshVoice();
    AgoraMessageManage::instance()->levelRoomHandler();
}
void GameRtcEngineEventHandler::onRemoteAudioStateChanged(uid_t uid, REMOTE_AUDIO_STATE state, REMOTE_AUDIO_STATE_REASON reason, int elapsed){
    
}

void GameRtcEngineEventHandler::onLocalVideoStats(const LocalVideoStats& stats){
    
}
void GameRtcEngineEventHandler::onUserMuteAudio(uid_t 	uid, bool 	muted) {

    int _uid = (int)uid;
    bool isopen = muted;
    AgoraMessageManage::instance()->playerChangeAudioSet(_uid,isopen);
    

}

void GameRtcEngineEventHandler::onAudioVolumeIndication(const AudioVolumeInfo* speakers, unsigned int speakerNumber, int totalVolume){
    
    bool isNeedSend = false;
    std::string str = "{\n\"players\":[\n";
    for (int i = 0; i<speakerNumber; i++) {
        if(speakers[i].volume>0){
            str+="{\n";
            str+="\"uid\":";
            str+= std::to_string(speakers[i].uid);
            str+=",\n";
            str+="\"volume\":";
            str+=std::to_string(speakers[i].volume);
            str+="\n";
            str+="}\n";
            if (speakers[i].volume>=0) {
                isNeedSend=true;
            }
        }
		if (i < speakerNumber - 1) {
			str += ",";
		}
    }
   
    str+="]\n}\n";
    if (isNeedSend) {
        AgoraMessageManage::instance()->addOneVoiceChange(str);
    }
    
//    MessageDispatcher::getInstance()->callLuaFunction("app/native/IAgoraCallBackHandler.lua", "onAudioVolumeIndication", 1, 0, str.c_str(), str.length());
}
#endif
