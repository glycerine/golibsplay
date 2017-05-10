# Prerequisite:
# set the PYTHON_INCLUDE variable such that <Python.h> can be #included
# by the  -I$(PYTHON_INCLUDE) flag below:
ANACONDA_INSTALL := $(HOME)/uns/anaconda
PYTHON_INCLUDE := $(ANACONDA_INSTALL)/anaconda/include/python2.7

all:
	# this first go build generates the mylib.h, but will fail to compile
	# because we also need mylib_wrap.c from swig, which depends on mylib.h.
	# hence we run 'go build' twice, and keep going after the first one fails.
	go build -buildmode=c-shared mylib.go || true
	swig -outdir demos/python-swig/ -python mylib.i
	gcc -fPIC -O2 -c -o mylib_wrap.o mylib_wrap.c -I$(PYTHON_INCLUDE)
	ar cr libmylib_wrap.a mylib_wrap.o
	go build -buildmode=c-shared mylib.go

clean:
	rm -f libmylib_wrap.a mylib.h mylib_wrap.c
