; This code is NOT working at all

#include 'thread.au3'

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <INet.au3>

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Get two sources at once", 664, 441, 229, 151)
$Group1 = GUICtrlCreateGroup("Page 1", 8, 128, 321, 305)
$Edit1 = GUICtrlCreateEdit("", 16, 144, 305, 281)
GUICtrlSetData(-1, "Edit1")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Page 2", 336, 128, 321, 305)
$Edit2 = GUICtrlCreateEdit("", 344, 144, 305, 281)
GUICtrlSetData(-1, "Edit2")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Input1 = GUICtrlCreateInput("http://google.com", 8, 8, 321, 21)
$Input2 = GUICtrlCreateInput("http://autoitscript.com", 336, 8, 321, 21)
$Button1 = GUICtrlCreateButton("Get two sources at once with the amazingness of the threads!", 152, 56, 361, 33)
GUICtrlSetOnEvent(-1, "Button1Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Button1Click()
	CreateThread("thread1")
	CreateThread("thread2")
EndFunc

; Threads
Func thread1($x)
	Local $sURL, $sSource
	$sURL = GUICtrlRead($Input1)
	$sSource = _INetGetSource($sURL)
	GUICtrlSetData($Edit1, $sSource)
	MsgBox(0, "", $sSource)
EndFunc

Func thread2($x)
	Local $sURL, $sSource
	$sURL = GUICtrlRead($Input2)
	$sSource = _INetGetSource($sURL)
	GUICtrlSetData($Edit2, $sSource)
EndFunc
