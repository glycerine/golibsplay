package main

/*
typedef struct { long long x; long long y; } Coords;
*/
import "C"
import (
	"fmt"
	"github.com/jstoiko/golibsplay/core"
	"path/filepath"
)

//export PrintGoStr
func PrintGoStr(s string) {
	fmt.Printf("\n ...inside the PrintGoStr() with s='%v'.\n", s)
	core.PrintStr(s)
}

//export PrintInt
func PrintInt(s int) {
	fmt.Println(s)
}

//export PrintCStr
func PrintCStr(s *C.char) {
	fmt.Println(C.GoString(s))
}

//export PrintStruct
func PrintStruct(c C.Coords) {
	fmt.Printf("\n ...inside the PrintStruct() with c=%#v.\n", c)
	fmt.Println(c)
}

//export PrintStructMeth
func (c C.Coords) PrintStructMeth() {
	fmt.Printf("\n ...inside the PrintStructMeth() with c=%#v.\n", c)
	fmt.Println(c)
}

//export GetFirstJSONElement
func GetFirstJSONElement(p *C.char) *C.char {
	fmt.Printf("\n ...inside GetFirstJSONElement(p) with p=%#v.\n", C.GoString(p))
	path, err := filepath.Abs(C.GoString(p))
	if err != nil {
		return C.CString(core.DumpError(err))
	}
	el, err := core.GetFirstFileElement(path)
	if err != nil {
		return C.CString(core.DumpError(err))
	}
	return C.CString(el)
}

func main() {}

// v-- Not used by C yet --v

//export PrintMap
func PrintMap(m map[int]int) {
	fmt.Println(m)
}
