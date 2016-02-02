F1:: 
StartTime := A_TickCount 
SetTimer, MyTimerFct, 10 
return 

MyTimerFct: 
	ElapsedTime := A_TickCount - StartTime 
	if (ElapsedTime >= 5 * 1000)	; 5초 지났으면 
	{ 
		SetTimer,MyTimerFct, off	; 타이머 끄고 
		MsgBox, % "Timer : " (A_TickCount - StartTime) " milliseconds have elapsed." 
	} 
	return 
	
F2:: 
StartTime := A_TickCount 
loop 
{ 
	sleep, 10 
	ElapsedTime := A_TickCount - StartTime 
	if (ElapsedTime >= 5 * 1000)	; 5 지났으면 
		break 
} 
MsgBox, % "Loop : " (A_TickCount - StartTime) " milliseconds have elapsed." 
return