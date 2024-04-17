LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := yasio_static

LOCAL_MODULE_FILENAME := libyasio

LOCAL_CPPFLAGS := -std=c++1y -pthread -frtti -fexceptions

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../ $(LOCAL_PATH)/../../../../cocos2d-x/external/lua/luajit/include $(LOCAL_PATH)/../../../../cocos2d-x/cocos

LOCAL_SRC_FILES := ../../xxsocket.cpp \
    ../../yasio.cpp \
    ../../ibstream.cpp \
    ../../obstream.cpp \
    ../../bindings/lyasio.cpp \
    ../../bindings/yasio_cclua.cpp \
	../../../external/kcp/ikcp.c

include $(BUILD_STATIC_LIBRARY)
