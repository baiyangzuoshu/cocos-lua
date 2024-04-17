//
//  IAgoraMessageManage.cpp
//  letsroll-mobile
//
//  Created by 魏雨 on 2022/6/6.
//

#include "IAgoraMessageManage.hpp"
#include "LuaSystemCall.h"

AgoraMessageManage* AgoraMessageManage::m_instance = nullptr;
//pthread_mutex_t AgoraMessageManage::mutex;
AgoraMessageManage * AgoraMessageManage::instance(){
    if (NULL == m_instance)
    {
        //加锁(多线程场景下)
        //pthread_mutex_lock(&mutex);
        if (NULL == m_instance)
        {
            AgoraMessageManage * pInstance = new AgoraMessageManage();
            //pInstance->init();
            m_instance = pInstance;
        }
        //解锁
        //pthread_mutex_unlock(&mutex);
    }
    return m_instance;
}

void AgoraMessageManage::addOneVoiceChange(std::string str){
    m_allAudioVolumes.push_back(str);
}

std::string AgoraMessageManage::getOneVoiceChange(){
    if (m_allAudioVolumes.size()>0) {
        std::string str = m_allAudioVolumes[0];
        m_allAudioVolumes.erase(m_allAudioVolumes.begin());
        return str;
    }
    return "";
}

void AgoraMessageManage::oneMessageNeedHandle(){
    std::string str = getOneVoiceChange();
    if (str.length()>0) {
        SaveData* data = new SaveData();
        data->name = "AODIO_CHANGE_MESSAGE_CALLBACK";
        data->value1 = str;
        mutex_.lock();
        m_allEvents.push_back(data);
        mutex_.unlock();
        //g_LuaSystemCall->instance()->CallLuaFunc("AODIO_CHANGE_MESSAGE_CALLBACK", str.c_str());
        //MessageDispatcher::getInstance()->callLuaFunction("app/native/IAgoraCallBackHandler.lua", "onAudioVolumeIndication", 1, 0, str.c_str(), str.length());
        
    }
}
void AgoraMessageManage::playerChangeAudioSet(int uid,bool isnotOpen)
{
    SaveData* data = new SaveData();
    data->name = "AODIO_PLAYER_CHANNEL_SETTING";
    data->value2 = uid;
    data->value3 = isnotOpen;
    mutex_.lock();
    m_allEvents.push_back(data);
    mutex_.unlock();
    //g_LuaSystemCall->instance()->CallLuaFunc("AODIO_PLAYER_CHANNEL_SETTING",uid,isnotOpen);
}

void AgoraMessageManage::joinRoomHandler(int _uid)
{
    SaveData* data = new SaveData();
    data->name = "AODIO_PLAYER_JOIN_ROOM";
    data->value2 = _uid;
    mutex_.lock();
    m_allEvents.push_back(data);
    mutex_.unlock();
    //data.value3 = isnotOpen;
    //g_LuaSystemCall->instance()->CallLuaFunc("AODIO_PLAYER_JOIN_ROOM", _uid);
}

void AgoraMessageManage::levelRoomHandler()
{
    SaveData* data = new SaveData();
    data->name = "AODIO_PLAYER_LEVEL_ROOM";
    mutex_.lock();
    m_allEvents.push_back(data);
    mutex_.unlock();
    //g_LuaSystemCall->instance()->CallLuaFunc("AODIO_PLAYER_LEVEL_ROOM", 0.0f);
}

void AgoraMessageManage::checkOneEvent()
{
    mutex_.lock();
    if (m_allEvents.size() > 0) {
        for (int i = 0; i < m_allEvents.size(); i++)
        {
            SaveData* data = m_allEvents[i];
            if (data->name == "AODIO_CHANGE_MESSAGE_CALLBACK") {
                g_LuaSystemCall->instance()->CallLuaFunc(data->name, data->value1.c_str());
            }
            else if (data->name == "AODIO_PLAYER_CHANNEL_SETTING")
            {
                g_LuaSystemCall->instance()->CallLuaFunc(data->name, data->value2,data->value3);
            }
            else if (data->name == "AODIO_PLAYER_JOIN_ROOM")
            {
                g_LuaSystemCall->instance()->CallLuaFunc(data->name, data->value2);
            }
            else if (data->name == "AODIO_PLAYER_LEVEL_ROOM")
            {
                g_LuaSystemCall->instance()->CallLuaFunc(data->name, 0.0f);
            }
            delete data;
            data = nullptr;
            

        }
        m_allEvents.clear();
    }
    mutex_.unlock();
}
