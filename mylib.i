%module my
%{
#include "mylib.h"
%}

extern void PrintGoStr(GoString p0);
extern void PrintInt(GoInt p0);
extern void PrintCStr(char* p0);
extern void PrintStruct(Coords p0);
extern void PrintStructMeth(Coords recv);
extern void PrintMap(GoMap p0);
