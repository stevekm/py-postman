SHELL:=/bin/bash

# ~~~~~ Python and nextflow installation ~~~~~~ #
UNAME:=$(shell uname)
PATH:=$(CURDIR)/conda/bin:$(PATH)
unexport PYTHONPATH
unexport PYTHONHOME

ifeq ($(UNAME), Darwin)
CONDASH:=Miniconda3-4.5.4-MacOSX-x86_64.sh
endif

ifeq ($(UNAME), Linux)
CONDASH:=Miniconda3-4.5.4-Linux-x86_64.sh
endif

CONDAURL:=https://repo.continuum.io/miniconda/$(CONDASH)

conda:
	@echo ">>> Setting up conda..."
	@wget "$(CONDAURL)" && \
	bash "$(CONDASH)" -b -p conda && \
	rm -f "$(CONDASH)"

install: conda
	conda install -y anaconda::flask

# ~~~~~ Run the Flask server ~~~~~ #
export FLASK_APP:=postman.py
export FLASK_RUN_PORT:=5000
export FLASK_RUN_HOST:=127.0.0.1
run:
	flask run
