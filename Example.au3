; This code works

#include 'thread.au3'

$h = CreateThread("foo")

; Opens another one
CreateThread("bar")

; And opens another one, that will just close itself (as an example)
CreateThread("openandclose")

MsgBox(0, "Hey", "I am the main thread" & @CRLF & "Opened thread: " & $h)

TerminateThread($h) ; Terminates one of the threads

Exit ; this is needed, otherwise the main process won't close

Func foo($hThread)
	MsgBox(0, "Hey", "I am a sub thread")
EndFunc

Func bar($hThread)
	MsgBox(0, "Hey", "I am a sub thread (another one)")
EndFunc

Func openandclose($hThread)
	Return TerminateThread($hThread)
	MsgBox(0, "Hey", "This message will not show up")
EndFunc