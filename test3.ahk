#SingleInstance force ; single...

CoordMode Pixel,Screen   ; image searching.... 
CoordMode Mouse ; mouse click.... 한글 입력이 잘되는 지 봅시다.

gui, add, text, x30 y15 w110 h20,start programming
Gui, add, Text, x20 y30 w110 h20 vA, ready
Gui, add, Text, x20 y50 w110 h20 vB, 0 cnt
Gui, add, button, x20 y80 w110 h20, B1
Gui, add, button, x20 y100 w110 h20, B2
gui,show

m_macro := false

return

ButtonB1:
{
	m_macro := true
	;Loop
	;{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\B.J\SkyDrive\__Code\autohotkey\image\download.bmp
	
		;MsgBox %A_ScreenWidth% x %A_ScreenHeight%

		if ErrorLevel = 2
			MsgBox Could not conduct the search.
		else if ErrorLevel = 1
			MsgBox Icon could not be found on the screen.
		else
		{
			Send, {Control down}
			MouseClick, left, %FoundX%, %FoundY%
			Send, {Control up}
			;MsgBox The icon was found at %FoundX%x%FoundY%
			;MsgBox sorry
			MouseClick, left, %FoundX%, %FoundY%
			MouseClick, left, %FoundX%, %FoundY%
		
		}
			
		if(m_macro = false)
		{
			;break
		}
	;}
}
return


ButtonB2:
{
	m_macro := false
	ExitApp
}
return
