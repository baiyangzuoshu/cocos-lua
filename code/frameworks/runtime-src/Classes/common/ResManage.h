#ifndef __RESMANAGE_H__
#define __RESMANAGE_H__

#include "cocos2d.h"

/**
* ��Դ������
*/
class ResManage {
public:

    ~ResManage();

    static ResManage *instance();

    void loadPlistRes(std::string path);

    void unLoadPlistRes(std::string path);

    void loadTextureAsync(const char *_paths, int luaCallbck = 0);


    void callback(cocos2d::CCObject *pSender);

private:
    ResManage();

private:
    int mLuaCallback;

    int count;
    int total;
};

#endif
