#include-once
#cs
	AutoIt Threads
	http://github.com/jesobreira/thread.au3
#ce

Func CreateThread($sCallback)
	Local $Handle, $Struct
	$Handle = DllCallbackRegister($sCallback, "int", "ptr")
	$Struct = DllStructCreate("Char[200];int")
	DllStructSetData($Struct, 1, 10)
	Return DllCall("kernel32.dll", "hwnd", "CreateThread", "ptr", 0, "dword", 0, "long", DllCallbackGetPtr($Handle), "ptr", DllStructGetPtr($Struct), "long", 0, "int*", 0)[0]
EndFunc   ;==>CreateThread

Func TerminateThread($hWnd)
	Return DllCall("kernel32.dll", "bool", "TerminateThread", "handle", $hWnd, "dword", 0)
EndFunc   ;==>TerminateThread
