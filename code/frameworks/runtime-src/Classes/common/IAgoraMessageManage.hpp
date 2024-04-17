//
//  IAgoraMessageManage.hpp
//  letsroll-mobile
//
//  Created by 魏雨 on 2022/6/6.
//

#ifndef IAgoraMessageManage_hpp
#define IAgoraMessageManage_hpp
//#include <mutex>
//
//#include <pthread.h>

#include <iostream>
#include <vector>
#include <mutex> 

class AgoraMessageManage{
public:
    struct SaveData
    {
        const char* name="";
        std::string value1="";
        int value2=0;
        bool value3=false;
    };
    static AgoraMessageManage * instance();
    
    void addOneVoiceChange(std::string str);
    std::string getOneVoiceChange();
    
    void playerChangeAudioSet(int uid,bool isnotOpen);
    
    void oneMessageNeedHandle();

    void  joinRoomHandler(int _uid);

    void  levelRoomHandler();

    void  checkOneEvent();
    
    
private:
    static AgoraMessageManage* m_instance;
private:
    //static pthread_mutex_t mutex;
    
    std::vector<std::string> m_allAudioVolumes;

    std::vector<SaveData*> m_allEvents;

    std::mutex mutex_;
};

#endif /* IAgoraMessageManage_hpp */
