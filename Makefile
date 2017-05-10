# Prerequisite:
# set the PYTHON_INCLUDE variable such that <Python.h> can be #included
# by the  -I$(PYTHON_INCLUDE) flag below:
ANACONDA_INSTALL := $(HOME)/uns/anaconda
PYTHON_INCLUDE := $(ANACONDA_INSTALL)/anaconda/include/python2.7

all:
	gcc -fPIC -O2 -c -o mylib_wrap.o mylib_wrap.c -I$(PYTHON_INCLUDE)
	ar cr libmylib_wrap.a mylib_wrap.o
	go build -buildmode=c-shared mylib.go
