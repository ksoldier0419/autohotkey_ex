#SingleInstance force ; single...

CoordMode Pixel,Screen   ; image searching.... 
CoordMode Mouse ; mouse click.... �ѱ� �Է��� �ߵǴ� �� ���ô�.

SysGet, MonitorCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary

+F2::ExitApp  ;��ũ��Ʈ����


F2::  ;shirt+ ctrl^
{
	m_macro := true

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\download.bmp

	if ErrorLevel = 2
	{
		MsgBox Could not conduct the search.
		return ; ������ ������������ �ٽ� �޽��� ���� ������
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

	Loop ;�ٿ�ε� â�� �㶧���� ���鼭 �����ϱ�
	{

			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\save.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}

	Loop ;�Ͻ�������Ű��
	{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\pausebt.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}		

	Loop ; ���� ȭ������ ���ƿ���.
	{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\movebt.bmp
			if ErrorLevel = 0
			{
				MouseClick, left, %FoundX%, %FoundY%
				break
			}	
		
	}
	
	loop,10  ;��ũ�� �ؼ� �ϴ����� ������
		click WheelDown
		
	 
}
