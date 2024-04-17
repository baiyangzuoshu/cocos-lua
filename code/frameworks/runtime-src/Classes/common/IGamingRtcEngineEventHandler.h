//
//  IGamingRtcEngineEventHandler.hpp
//  letsroll-mobile
//
//  Created by 魏雨 on 2022/6/6.
//

#ifndef IGamingRtcEngineEventHandler_hpp
#define IGamingRtcEngineEventHandler_hpp
#include"cocos2d.h"
#if(CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    #include <AgoraRtcKit/IAgoraMediaEngine.h>
    #include <AgoraRtcKit/IAgoraRtcEngine.h>
    using namespace agora::rtc;
#elif (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
    #include "IAgoraMediaEngine.h"
    #include "IAgoraRtcEngine.h"
    using namespace agora::rtc;
#endif

#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
class GameRtcEngineEventHandler : public IRtcEngineEventHandler {
    
public:
    virtual void onError(int err, const char* msg);
        //{该回调方法表示 SDK 运行时出现了网络或媒体相关的错误。通常情况下，SDK 上报的错误意味着 SDK 无法自动恢复，需要 app 干预或提示用户。
        //	(void)err;
        //	(void)msg;
        //}

    virtual void onUserJoined(uid_t uid, int elapsed);
        //{远端用户（通信场景）/主播（直播场景）加入当前频道回调。
        //    (void)uid;
       //     (void)elapsed;
       // }

    virtual void onUserOffline(uid_t uid, USER_OFFLINE_REASON_TYPE reason);
        //{远端用户（通信场景）/主播（直播场景）离开当前频道回调。
        //    (void)uid;
        //    (void)reason;
        //}

    virtual void onRejoinChannelSuccess(const char* channel, uid_t uid, int elapsed);
	//{有时候由于网络原因，客户端可能会和服务器失去连接，SDK 会进行自动重连，自动重连成功后触发此回调方法
	//	(void)channel;
	//	(void)uid;
	//	(void)elapsed;
	//}

    virtual void onJoinChannelSuccess(const char* channel, uid_t uid, int elapsed);//
//    {
//        IAgoraRoomManager::instance()->isInroom=true;
//        IAgoraRoomManager::instance()->refrshVoice();
//    }
    // ◊¢≤· onLeaveChannel ªÿµ˜°£
    // ±æµÿ”√ªß≥…π¶¿Îø™∆µµ¿ ±£¨ª·¥•∑¢∏√ªÿµ˜°£
    virtual void onLeaveChannel(const agora::rtc::RtcStats& stats);//
//    override {
//        IAgoraRoomManager::instance()->isInroom=false;
//        IAgoraRoomManager::instance()->refrshVoice();
//    }


    virtual void onRemoteAudioStateChanged(uid_t uid, REMOTE_AUDIO_STATE state, REMOTE_AUDIO_STATE_REASON reason, int elapsed);
//    //  override{
//
//
//    }

    virtual void onLocalVideoStats(const LocalVideoStats& stats);// {
//        (void)stats;
//
//
//    }

    virtual void onUserMuteAudio(uid_t 	uid, bool 	muted);

    virtual void onAudioVolumeIndication(const AudioVolumeInfo* speakers, unsigned int speakerNumber, int totalVolume);//
//    {
//        std::string str = "{\n";
//        for (int i = 0; i<speakerNumber; i++) {
//            str+="\"player\":{\n";
//            str+="\"uid\":";
//            str+=speakers[i].uid;
//            str+="\n";
//            str+="\"volume\":";
//            str+=speakers[i].volume;
//            str+="\n";
//            str+="}\n";
//        }
//
//        str+="}\n";
//        MessageDispatcher::getInstance()->callLuaFunction("app/native/ApplePayHandler.lua", "handleApplePayment", 1, 0, str.c_str(), str.length());
//        //g_LuaSystemCall->CallLuaFunc("GAMEGLOABLEUPDATE", str.c_str());
//
//    }
};
#endif

#endif /* IGamingRtcEngineEventHandler_hpp */
