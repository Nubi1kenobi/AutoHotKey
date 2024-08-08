#NoEnv				; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input		; Recommended for new scripts due to its superior speed and reliability.

; Variable declarations
Global coord_x = 0
Global coord_y = (A_ScreenHeight / 4)

screenWidth := [(A_ScreenWidth / 2), 1920, 1280]
screenHeight := [A_ScreenHeight, (A_ScreenHeight / 2), (A_ScreenHeight / 3)]
screenIncrement := [A_ScreenWidth, (A_ScreenWidth / 2), (A_ScreenWidth / 3)]

; Main
msgBox, "To select the Active Window, or the program that is off the screen, use ALT-TAB to select t, then hit Windows-F1"

#F1::	
{
	moveActiveWindow(screenHeight.3, screenWidth.1, screenIncrement.2)
	;moveActiveWindow(100, 200, 50)
}
Return
	
; Functions
moveActiveWindow(newWindowHeight, newWindowWidth, newWindowIncrement)
{
	height := newWindowHeight
	width := newWindowWidth
	widthIncrement := newWindowIncrement
	limiter := 1920 ; Edge for rotation, adjust as needed
	;MsgBox, function parameters for moveActiveWindow(): height = %height%, width = %width% and increment = %widthIncrement%
	WinMove, A,, coord_x, coord_y, width, height
	coord_x := coord_x + widthIncrement
	if (coord_x >= limiter) 
	{
		coord_x := 0
	}
}
