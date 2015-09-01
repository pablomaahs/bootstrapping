LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := libopenal-android

LOCAL_ARM_MODE := arm
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../src/openal-android/Chapter5/OpenAL \
    $(LOCAL_PATH)/../src/openal-android/Chapter5/OpenAL/include \
    $(LOCAL_PATH)/../src/openal-android/Chapter5/OpenAL/OpenAL32/Include \
    $(LOCAL_PATH)/../src/openal-android/Chapter5/OpenAL/Alc

LOCAL_SRC_FILES  := \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alAuxEffectSlot.c \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alBuffer.c        \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alDatabuffer.c    \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alEffect.c        \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alError.c         \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alExtension.c     \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alFilter.c        \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alListener.c      \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alSource.c        \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alState.c         \
    ../src/openal-android/Chapter5/OpenAL/OpenAL32/alThunk.c         \
    ../src/openal-android/Chapter5/OpenAL/Alc/ALc.c                  \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcConfig.c            \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcEcho.c              \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcModulator.c         \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcReverb.c            \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcRing.c              \
    ../src/openal-android/Chapter5/OpenAL/Alc/alcThread.c            \
    ../src/openal-android/Chapter5/OpenAL/Alc/ALu.c                  \
    ../src/openal-android/Chapter5/OpenAL/Alc/android.c              \
    ../src/openal-android/Chapter5/OpenAL/Alc/bs2b.c                 \
    ../src/openal-android/Chapter5/OpenAL/Alc/null.c                 \

LOCAL_CFLAGS := -ffast-math -DAL_BUILD_LIBRARY -DAL_ALEXT_PROTOTYPES -Wno-incompatible-pointer-types -Wno-enum-conversion -DHAVE_ANDROID=1

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
    LOCAL_ARM_NEON := true
    LOCAL_CFLAGS += -mfpu=neon -march=armv7-a
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a-hard)
    LOCAL_ARM_NEON := true
    LOCAL_CFLAGS += -mfloat-abi=hard -mfpu=neon -march=armv7-a
endif

ifeq ($(TARGET_ARCH_ABI),x86)
	LOCAL_CFLAGS += -m32 -march=i686 -mtune=atom -mssse3 -mfpmath=sse
endif

include $(BUILD_STATIC_LIBRARY)
