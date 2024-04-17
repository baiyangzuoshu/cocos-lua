
#include "IAgoraRoomManager.h"
#include "IGamingRtcEngineEventHandler.h"
#include "LuaSystemCall.h"

IAgoraRoomManager* IAgoraRoomManager::_videoRoomManager = nullptr;

IAgoraRoomManager* IAgoraRoomManager::instance() {
    if (!_videoRoomManager) {
        _videoRoomManager = new IAgoraRoomManager;
    }
    return _videoRoomManager;
}

void IAgoraRoomManager::initVideo(const char* appId)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
    this->_eventHandler = new GameRtcEngineEventHandler();
    this->_engine = createAgoraRtcEngine();

    agora::rtc::RtcEngineContext context;
    context.appId = appId;
    context.eventHandler = this->_eventHandler;

    this->_engine->initialize(context);
    this->_engine->adjustRecordingSignalVolume(250);
    this->_engine->adjustPlaybackSignalVolume(250);
    this->_engine->setAudioProfile(AUDIO_PROFILE_DEFAULT, AUDIO_SCENARIO_CHATROOM_GAMING);
    this->_engine->setChannelProfile(agora::rtc::CHANNEL_PROFILE_TYPE::CHANNEL_PROFILE_COMMUNICATION);
    
    this->_engine->setEnableSpeakerphone(true);
    this->_engine->enableAudioVolumeIndication(200,3,true);
	const char* str = "{\"che.audio.keep.audiosession\":true}";
	this->_engine->setParameters(str);
	this->_engine->setEnableSpeakerphone(true);
    //this->_engine->setLogFile("audioLog.txt");
#endif

}

void IAgoraRoomManager::joinRoom(const char* token, const char* channelName, const char* name, int uid)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return;
	}

    if(!isInroom){
//        agora::rtc::ChannelMediaOptions _options;
//        _options.autoSubscribeAudio=true;
//        _options.autoSubscribeVideo=true;
//        _options.publishLocalAudio=false;
//        _options.publishLocalVideo=false;
        //this->_engine->enableVideo();
        isStartInRoom = true;
        this->_engine->enableLocalAudio(false);
        //this->_engine->setClientRole(agora::rtc::CLIENT_ROLE_TYPE::CLIENT_ROLE_AUDIENCE);
        int ret=this->_engine->joinChannel(token, channelName, name, uid);
        if (ret != 0) {
            g_LuaSystemCall->instance()->CallLuaFunc("AODIO_PLAYER_JOIN_ROOM_FAIL", 0.0f);
        }
        
    }
    
#endif
}

void IAgoraRoomManager::leaveRoom()
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return;
	}

    if(isInroom){
        this->_engine->enableLocalAudio(false);
        int ret=this->_engine->leaveChannel();
        if (ret != 0) {
            g_LuaSystemCall->instance()->CallLuaFunc("AODIO_PLAYER_LEVEL_ROOM_FAIL", 0.0f);
        }
        isStartLevelRoom = true;
        
    }
    
#endif
}

int IAgoraRoomManager::enableLocalAudio(bool isOpen)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return false;
	}
    if(isOpen){
        this->_engine->enableLocalAudio(true);
    }
    return this->_engine->muteLocalAudioStream(!isOpen);
#endif

    return false;
}

int IAgoraRoomManager::adjustUserPlaybackSignalVolume(int uid, int volume)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return false;
	}
    return this->_engine->adjustUserPlaybackSignalVolume(uid, volume);
#endif
    return false;
}

int IAgoraRoomManager::muteRemoteAudioStream(int uid,bool muted)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return false;
	}
    return this->_engine->muteRemoteAudioStream(uid, muted);
#endif
    return false;
}

int IAgoraRoomManager::muteAllRemoteAudioStreams(bool isRemote)
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return false;
	}
    return this->_engine->muteAllRemoteAudioStreams(!isRemote);
#endif
    return false;
}

void IAgoraRoomManager::refrshVoice(){
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
	if (!this->_engine)
	{
        return;
     }
    const char* str = "{\"che.audio.keep.audiosession\":true}";
    this->_engine->setParameters(str);
    this->_engine->setEnableSpeakerphone(true);
#endif
}


IAgoraRoomManager::~IAgoraRoomManager()
{
#if(CC_TARGET_PLATFORM != CC_PLATFORM_WIN32)
    agora::rtc::IRtcEngine::release(true);
    this->_engine = nullptr;
    delete this->_eventHandler;
    this->_eventHandler = nullptr;
#endif
}

IAgoraRoomManager::IAgoraRoomManager():
    isStartLevelRoom(false)
    , isStartInRoom(false)
{

}
