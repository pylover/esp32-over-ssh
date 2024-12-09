SYSPY = $(shell which python3)
SYSPIP = $(shell which pip3)
VENV_PATH = /opt/esp32/pyenv
PY = $(VENVPATH)/bin/python3
PIP = $(VENVPATH)/bin/pip3


.PHONY: install
install:
	$(SYSPY) -m venv $(VENV_PATH)
	$(PIP) install esptool
