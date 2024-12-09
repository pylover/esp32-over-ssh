PY = $(shell which python3)
PIP = $(shell which pip3)
VENV_PATH = /opt/esp32/pyenv


.PHONY: install
install:
	$(PY) -m venv $(VENV_PATH)
