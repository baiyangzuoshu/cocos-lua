#include "DeviceManager.h"

#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID

#elif CC_TARGET_PLATFORM == CC_PLATFORM_IOS

#elif CC_TARGET_PLATFORM == CC_PLATFORM_WIN32
#include <windows.h>
#endif

DeviceManager *DeviceManager::sInstance = nullptr;


DeviceManager::DeviceManager() {
}

DeviceManager::~DeviceManager() {
}

DeviceManager *DeviceManager::getInstance() {
    if (!sInstance) {
        sInstance = new DeviceManager();
    }
    return sInstance;
}

bool DeviceManager::copyToClipboard(const char *content) {
#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
#elif CC_TARGET_PLATFORM == CC_PLATFORM_IOS
#elif CC_TARGET_PLATFORM == CC_PLATFORM_WIN32
    HWND hWnd = NULL;
    if (OpenClipboard(hWnd)) {
        EmptyClipboard();
        //�����ڴ�
        HANDLE hHandle = GlobalAlloc(GMEM_FIXED, 1000);
        //�����ڴ棬���������ڴ���׵�ַ
        char* pData = (char*)GlobalLock(hHandle);
        strcpy_s(pData, 1000, content);
        //���ü��а�����
        SetClipboardData(CF_TEXT, hHandle);
        //�������
        GlobalUnlock(hHandle);
        //�رռ��а�
        CloseClipboard();
    }
#endif
    return true;
}

std::string DeviceManager::pasteFromClipboard() {
    std::string result = "";
    //ճ������
#if CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID
#elif CC_TARGET_PLATFORM == CC_PLATFORM_IOS
#elif CC_TARGET_PLATFORM == CC_PLATFORM_WIN32
    HWND hWnd = NULL;
    if (OpenClipboard(hWnd)) {
        if (IsClipboardFormatAvailable(CF_TEXT))
        {
            //��ȡ���а�����
            HANDLE h = GetClipboardData(CF_TEXT);
            result = (char*)GlobalLock(h);
            GlobalUnlock(h);
        }
        //�رռ�����
        CloseClipboard();
    }
#endif
    return result;
}
