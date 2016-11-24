; This code works

#include 'thread.au3'

$h = _Thread_Create("foo")

; Opens another one
_Thread_Create("bar")

; And opens another one, that will just close itself (as an example)
_Thread_Create("openandclose")

MsgBox(0, "Hey", "I am the main thread" & @CRLF & "Opened thread: " & $h)

_Thread_Terminate($h) ; Terminates one of the threads

Exit ; this is needed, otherwise the main process won't close

Func foo($hThread)
	MsgBox(0, "Hey", "I am a sub thread")
EndFunc

Func bar($hThread)
	MsgBox(0, "Hey", "I am a sub thread (another one)")
EndFunc

Func openandclose($hThread)
	Return _Thread_Terminate($hThread)
	MsgBox(0, "Hey", "This message will not show up")
EndFunc