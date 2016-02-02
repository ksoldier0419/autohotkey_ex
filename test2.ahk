#SingleInstance force

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
	gui, submit, nohide
	GuiControl, , A, count++

}
return

ButtonB2:
{
	m_macro := false
	ExitApp
}
return

