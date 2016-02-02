#SingleInstance force ; single...

CoordMode Pixel,Screen   ; image searching.... 
CoordMode Mouse ; mouse click.... 한글 입력이 잘되는 지 봅시다.

SysGet, MonitorCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary

+F2::ExitApp  ;스크립트종료


F2::  ;shirt+ ctrl^
{
	m_macro := true

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\download.bmp

	if ErrorLevel = 2
	{
		MsgBox Could not conduct the search.
		return ; 밑으로 내려가지말고 다시 메시지 대기로 가야함
	}
	else if ErrorLevel = 1
	{ 
		MsgBox Icon could not be found on the screen.
		return
	}
	else
	{
		MouseClick, left, %FoundX%, %FoundY%
		;Sleep 3000
	}

	Loop ;다운로드 창이 뜰때까지 돌면서 저장하기
	{

			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\save.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}

	Loop ;일시정지시키기
	{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\pausebt.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}		

	Loop ; 원래 화면으로 돌아오기.
	{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\movebt.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}
	
	loop,10  ;스크롤 해서 하단으로 내려감
		click WheelDown
		
	 
}
