#
# Copyright © 2011-2012 Intel Corporation
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice (including the next
# paragraph) shall be included in all copies or substantial portions of the
# Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#

# Two identical libs are defined here.
# libdrm: for vendors. installed to /vendor/lib. libdrm_<vendor> uses this.
# libdrm_platform: for platform modules (such as libminui). installed to /system/lib

LIBDRM_COMMON_MK := $(call my-dir)/Android.common.mk

LOCAL_PATH := $(call my-dir)
LIBDRM_TOP := $(LOCAL_PATH)

include $(CLEAR_VARS)

# Import variables LIBDRM_{,H,INCLUDE_H,INCLUDE_ANDROID_H,INCLUDE_VMWGFX_H}_FILES
include $(LOCAL_PATH)/Makefile.sources

#static library for the device (recovery)
include $(CLEAR_VARS)

LOCAL_MODULE := libdrm_platform

LOCAL_SRC_FILES := $(LIBDRM_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := \
       $(LOCAL_PATH) \
       $(LOCAL_PATH)/include/drm

LOCAL_C_INCLUDES := \
       $(LOCAL_PATH)/include/drm

include $(LIBDRM_COMMON_MK)
include $(BUILD_STATIC_LIBRARY)

# Dynamic library for the device
include $(CLEAR_VARS)

LOCAL_MODULE := libdrm_platform

LOCAL_SRC_FILES := $(LIBDRM_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := \
       $(LOCAL_PATH) \
       $(LOCAL_PATH)/include/drm

LOCAL_SHARED_LIBRARIES := \
	liblog

LOCAL_C_INCLUDES := \
       $(LOCAL_PATH)/include/drm

include $(LIBDRM_COMMON_MK)
include $(BUILD_SHARED_LIBRARY)

# Static library for the device (recovery)
include $(CLEAR_VARS)

LOCAL_MODULE := libdrm
LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES := $(LIBDRM_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/include/drm \
	$(LOCAL_PATH)/android

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include/drm

include $(LIBDRM_COMMON_MK)
include $(BUILD_STATIC_LIBRARY)

# Shared library for the device
include $(CLEAR_VARS)
LOCAL_MODULE := libdrm
LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES := $(LIBDRM_FILES)
LOCAL_EXPORT_C_INCLUDE_DIRS := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/include/drm \
	$(LOCAL_PATH)/android

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils

LOCAL_C_INCLUDES := \
        $(LOCAL_PATH)/include/drm

include $(LIBDRM_COMMON_MK)
include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
