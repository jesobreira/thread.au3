#include 'thread.au3'

_Thread_Create("helloworld")

Func helloworld($h)
	MsgBox(0, "", "Hello from the sub thread")
EndFunc

MsgBox(0, "", "Hello from the main thread")

Exit