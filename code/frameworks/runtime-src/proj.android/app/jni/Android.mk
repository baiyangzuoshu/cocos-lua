LOCAL_PATH := $(call my-dir)
# --- 引用 libBugly.so ---
include $(CLEAR_VARS)

LOCAL_MODULE := bugly_native_prebuilt
# 可在Application.mk添加APP_ABI := armeabi armeabi-v7a 指定集成对应架构的.so文件
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libBugly.so

include $(PREBUILT_SHARED_LIBRARY)
# --- end ---

HAVE_TEST_FFMPEG_SO := $(shell test -f $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-ffmpeg.so && echo yes)
ifeq ($(HAVE_TEST_FFMPEG_SO),yes)
USE_VIDEO := yes
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libagora-core
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-core.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libagora-fdkaac
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-fdkaac.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libagora-rtc-sdk
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-rtc-sdk.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libagora-soundtouch
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-soundtouch.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libagora-mpg123
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-mpg123.so
include $(PREBUILT_SHARED_LIBRARY)

ifeq ($(USE_VIDEO),yes)
include $(CLEAR_VARS)
LOCAL_MODULE := libagora-ffmpeg
LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-ffmpeg.so
include $(PREBUILT_SHARED_LIBRARY)


endif







#include $(CLEAR_VARS)
#LOCAL_MODULE := agora-rtc-sdk
#LOCAL_SRC_FILES := $(LOCAL_PATH)/../../../sdk/android/agora/$(TARGET_ARCH_ABI)/libagora-rtc-sdk.so

#include $(PREBUILT_SHARED_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE := cocos2dlua

LOCAL_MODULE_FILENAME := libcocos2dlua

define walk
  $(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef


ALLFILES = $(call walk, $(LOCAL_PATH)/../../../Classes)

FILE_LIST := hellolua/main.cpp \
FILE_LIST += $(filter %.cpp, $(ALLFILES))
FILE_LIST += $(filter %.c, $(ALLFILES))

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES += ../../../../cocos2d-x/external/lua/cjson/fpconv.c \
					../../../../cocos2d-x/external/lua/cjson/lua_cjson.c \
					../../../../cocos2d-x/external/lua/cjson/strbuf.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../Classes \
					$(LOCAL_PATH)/../../../Classes/protobuf \
					$(LOCAL_PATH)/../../../../yasio/yasio \
					$(LOCAL_PATH)/../../../sdk/include

# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END

LOCAL_STATIC_LIBRARIES := cclua_static
LOCAL_STATIC_LIBRARIES += yasio_static
# 引用 bugly/Android.mk 定义的Module
LOCAL_STATIC_LIBRARIES += bugly_crashreport_cocos_static
# 引用 bugly/lua/Android.mk 定义的Module
LOCAL_STATIC_LIBRARIES += bugly_agent_cocos_static_lua

LOCAL_SHARED_LIBRARIES := libagora-core libagora-fdkaac libagora-rtc-sdk libagora-soundtouch  libagora-mpg123

ifeq ($(USE_VIDEO), yes)
LOCAL_SHARED_LIBRARIES += libagora-ffmpeg
endif


# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module, cocos/scripting/lua-bindings/proj.android)
$(call import-module, ../yasio/yasio/jni/cocos-lua)
# 导入 bugly 静态库目录
$(call import-module,external/bugly)
$(call import-module,external/bugly/lua)
# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
