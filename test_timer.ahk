F1:: 
StartTime := A_TickCount 
SetTimer, MyTimerFct, 10 
return 

MyTimerFct: 
	ElapsedTime := A_TickCount - StartTime 
	if (ElapsedTime >= 5 * 1000)	; 5�� �������� 
	{ 
		SetTimer,MyTimerFct, off	; Ÿ�̸� ���� 
		MsgBox, % "Timer : " (A_TickCount - StartTime) " milliseconds have elapsed." 
	} 
	return 
	
F2:: 
StartTime := A_TickCount 
loop 
{ 
	sleep, 10 
	ElapsedTime := A_TickCount - StartTime 
	if (ElapsedTime >= 5 * 1000)	; 5 �������� 
		break 
} 
MsgBox, % "Loop : " (A_TickCount - StartTime) " milliseconds have elapsed." 
return