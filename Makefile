export THEOS_DEVICE_IP = 10.0.0.4
export GO_EASY_ON_ME = 1
include theos/makefiles/common.mk

TWEAK_NAME = SiriBoard
SiriBoard_FILES = SiriBoard.x
SiriBoard_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
