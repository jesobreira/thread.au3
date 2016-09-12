#include-once
#cs
	AutoIt Threads
	http://github.com/jesobreira/thread.au3
#ce

Func CreateThread($sCallback)
	Local $hHandle, $tStruct, $aResult
	$hHandle = DllCallbackRegister($sCallback, "int", "ptr")
	$tStruct = DllStructCreate("Char[200];int")
	DllStructSetData($tStruct, 1, 10)
	$aResult = DllCall("kernel32.dll", "hwnd", "CreateThread", "ptr", 0, "dword", 0, "long", DllCallbackGetPtr($hHandle), "ptr", DllStructGetPtr($tStruct), "long", 0, "int*", 0)
	Return (Not @error And IsArray($aResult)) ? $aResult[0] : SetError(1, 0, False)
EndFunc   ;==>CreateThread

Func TerminateThread($hWnd)
	Return DllCall("kernel32.dll", "bool", "TerminateThread", "handle", $hWnd, "dword", 0)
EndFunc   ;==>TerminateThread
