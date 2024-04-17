#ifndef __DEVICE_MANAGER_H__
#define __DEVICE_MANAGER_H__

#include "cocos2d.h"

class DeviceManager {
public:
    static DeviceManager *getInstance();

    bool copyToClipboard(const char *content);

    std::string pasteFromClipboard();

    ~DeviceManager();

private:
    static DeviceManager *sInstance;

    DeviceManager();
};

#endif
