#SingleInstance force ; single...

CoordMode Pixel,Screen   ; image searching.... 
CoordMode Mouse ; mouse click.... 한글 입력이 잘되는 지 봅시다.

gui, add, text, x20 y15 w110 h20,프로그램종료시간
gui, add, edit, x20 y40 w50 h20 vEndTime1,0
gui, add, edit, x70 y40 w50 h20 vEndTime2,0
gui, add, Text, x20 y65 w110 h20 vA, ready
;Gui, add, Text, x20 y50 w110 h20 vB, 0 cnt
Gui, add, button, x20 y95 w110 h20, BMonitor
Gui, add, button, x20 y120 w110 h20, BPause
Gui, add, button, x20 y145 w110 h20, BStart
gui,show


m_pause := 0

return

ButtonBPause:
{
	Loop
	{		
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\naver_pause.bmp

		if ErrorLevel = 2
		{
			MsgBox Could not conduct the search???.
			;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
		}
		else if ErrorLevel = 1
		{ 
			MsgBox Icon could not be found on the screen''''.		
			return
		}

		if ErrorLevel = 0
		{
			MouseClick, left, %FoundX%, %FoundY%
			break
		}	
	}

	Loop
	{		
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\oCam_pause.bmp

		if ErrorLevel = 2
		{
			MsgBox Could not conduct the search???.
			;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
		}
		else if ErrorLevel = 1
		{ 
			MsgBox Icon could not be found on the screen''''.		
			return
		}

		if ErrorLevel = 0
		{
			MouseClick, left, %FoundX%, %FoundY%
			m_pause := 1			
			break
		}	
	}
}
return

ButtonBStart:
{
	Loop
	{		
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\naver_play.bmp

		if ErrorLevel = 2
		{
			MsgBox Could not conduct the search???.
			;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
		}
		else if ErrorLevel = 1
		{ 
			MsgBox Icon could not be found on the screen''''.		
			return
		}

		if ErrorLevel = 0
		{
			MouseClick, left, %FoundX%, %FoundY%
			break
		}	
	}
	Loop
	{		
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\oCam_replay.bmp

		if ErrorLevel = 2
		{
			MsgBox Could not conduct the search???.
			;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
		}
		else if ErrorLevel = 1
		{ 
			MsgBox Icon could not be found on the screen''''.		
			return
		}

		if ErrorLevel = 0
		{
			MouseClick, left, %FoundX%, %FoundY%
			m_pause := 0
			break
		}	
	}	
}
return

ButtonBMonitor:
{
	StartTime := A_TickCount 
	SetTimer, MyTimerFct, 10 
	return 

	MyTimerFct:

		ElapsedTime := A_TickCount - StartTime
		total_sec := Round(ElapsedTime/1000)
		
		tmpsec := mod(total_sec,60)
		tmpmin := Round((total_sec - tmpsec)/60)
		
		Gui,submit,nohide
		GuiControl,,A, %tmpmin% : %tmpsec% 
		
		
		EndTime := EndTime1*60 + EndTime2
		
		if (ElapsedTime >= EndTime * 1000)	; 5초 지났으면 
		{ 
			SetTimer,MyTimerFct, off	; 타이머 끄고 
			;MsgBox, % "Timer : " (A_TickCount - StartTime) " milliseconds have elapsed." 
			
			Loop
			{
				
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\oCam_stop.bmp

				if ErrorLevel = 2
				{
					;MsgBox Could not conduct the search???.
					;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
				}
				else if ErrorLevel = 1
				{ 
					;MsgBox Icon could not be found on the screen''''.		
					;return
				}
	
				if ErrorLevel = 0
				{
					MouseClick, left, %FoundX%, %FoundY%
					break
				}	
			}

			Loop
			{
				
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\oCam_open.bmp

				if ErrorLevel = 2
				{
					;MsgBox Could not conduct the search???.
					;return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
				}
				else if ErrorLevel = 1
				{ 
					;MsgBox Icon could not be found on the screen''''.		
					;return
				}
	
				if ErrorLevel = 0
				{
					MouseClick, left, %FoundX%, %FoundY%
					break
				}	
			}
		} 
		return 
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

