# MCU name
MCU = RP2040
BOOTLOADER = rp2040
BOARD = GENERIC_RP_RP2040

CUSTOM_MATRIX = lite
SRC += matrix.c

SERIAL_DRIVER = vendor
# this turns on trackpoint:
#PS2_MOUSE_ENABLE = no
# this turns on trackballs including pimoroni
POINTING_DEVICE_ENABLE = yes
# this selects trackball driver
POINTING_DEVICE_DRIVER = pmw3360
# pimoroni_trackball
# pmw3389

ifeq ($(strip $(POINTING_DEVICE_DRIVER)), pimoroni_trackball)
	OPT_DEFS += -DPOINTING_DEVICE_IS_PIMORONI
endif

ifeq ($(strip $(POINTING_DEVICE_DRIVER)), pmw3360)
	OPT_DEFS += -DPOINTING_DEVICE_IS_PMW3360
endif

ifeq ($(strip $(POINTING_DEVICE_DRIVER)), pmw3389)
	OPT_DEFS += -DPOINTING_DEVICE_IS_PMW3389
endif

# this turns on Manna-Harbour's automousekeys:
MH_AUTO_BUTTONS = yes

ifeq ($(strip $(MH_AUTO_BUTTONS)), yes)
  MOUSEKEY_ENABLE = yes
  OPT_DEFS += -DMH_AUTO_BUTTONS
endif



