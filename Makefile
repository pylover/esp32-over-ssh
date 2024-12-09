SYSPY = $(shell which python3)
SYSPIP = $(shell which pip3)
VENVPATH = /opt/esp32/pyenv
PY = $(VENVPATH)/bin/python3
PIP = $(VENVPATH)/bin/pip3
BUILDPATH = build
ESPTOOL = $(VENVPATH)/bin/esptool.py
ESPTOOL_FLAGS = \
	--chip esp32s3 \
	-p /dev/ttyUSB0 \
	-b 460800 \
	--before=default_reset \
	--after=hard_reset

ESPTOOL_FLASHFLAGS = \
	--flash_mode dio \
	--flash_freq 80m \
	--flash_size 2MB \
	0x0 $(BUILDPATH)/bootloader/bootloader.bin \
	0x10000 $(BUILDPATH)/boilerplate.bin \
	0x8000 $(BUILDPATH)/partition_table/partition-table.bin


.PHONY: install
install:
	$(SYSPY) -m venv $(VENVPATH)
	$(PIP) install esptool


.PHONY: flash
flash:
	$(ESPTOOL) $(ESPTOOL_FLAGS) write_flash $(ESPTOOL_FLASHFLAGS)
