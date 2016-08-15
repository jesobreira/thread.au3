#include 'thread.au3'

CreateThread("helloworld")

Func helloworld($h)
	MsgBox(0, "", "Hello from the sub thread")
EndFunc

MsgBox(0, "", "Hello from the main thread")

Exit