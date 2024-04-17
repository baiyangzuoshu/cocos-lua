//
// Created by LXH on 2020/10/13.
//

#ifndef __IAgoraRoomManager_H__
#define __IAgoraRoomManager_H__

#include"cocos2d.h"
//#include "MessageDispatcher.h"



#if(CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
	#include <AgoraRtcKit/IAgoraMediaEngine.h>
	#include <AgoraRtcKit/IAgoraRtcEngine.h>
	using namespace agora::rtc;
#elif (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
	#include "IAgoraMediaEngine.h"
	#include "IAgoraRtcEngine.h"
	using namespace agora::rtc;
#endif




class IAgoraRoomManager{
public:
	static IAgoraRoomManager* instance();

	void initVideo(const char* appId);

	void joinRoom(const char* token,const char* channelName,const char* name="let`s roll",int uid=0);

	void leaveRoom();

	int enableLocalAudio(bool isOpen);

	int muteAllRemoteAudioStreams(bool isRemote);

	int muteRemoteAudioStream(int uid, bool muted);

	int adjustUserPlaybackSignalVolume(int uid, int volume);
    
    void refrshVoice();
    
    
private:
	IAgoraRoomManager();

	~IAgoraRoomManager();


private:
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	agora::rtc::IRtcEngineEventHandler* _eventHandler;

	agora::rtc::IRtcEngine* _engine;
#endif

	static IAgoraRoomManager* _videoRoomManager;
public:
    bool isInroom = false;
	bool isStartLevelRoom = false;
	bool isStartInRoom = false;
    
    

};
#endif
