all:
	gcc -fPIC -O2 -c -o mylib_wrap.o mylib_wrap.c -I/Users/jaten/uns/anaconda/anaconda/include/python2.7
	ar cr libmylib_wrap.a mylib_wrap.o
	go build -buildmode=c-shared mylib.go
