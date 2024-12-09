SYSPY = $(shell which python3)
SYSPIP = $(shell which pip3)
VENVPATH = /opt/esp32/pyenv
PY = $(VENVPATH)/bin/python3
PIP = $(VENVPATH)/bin/pip3


.PHONY: install
install:
	$(SYSPY) -m venv $(VENVPATH)
	$(PIP) install esptool
