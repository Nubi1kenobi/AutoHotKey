#NoEnv				; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input		; Recommended for new scripts due to its superior speed and reliability.

Global Config_File := "c:\AHK_Configs\windowresizer.ini" 
;Global Config_File := "networkdrive:\share\Stauch\AHK_Configs\" . A_UserName . ".ini"  ;.ini config file path
;The above path is what I used on a previous version  of this when I shared this program at work (call center), and had the *ini on a network drive, and each person that used this it would create them an *ini file. It was cool, because I could basically see who was consistanly using it and not.

;This script is two parts.
;First:
;I have two 49" monitors stacked on top of each other, and the main monitor is the one on the bottom.
;I also have a 42" TV hooked up and the F1-7 cycles a variety of screen sizes through both of the 49" monitors.
;Second:
;I have 2 computers, the secon computer has a 24" and a 27" monitor hooked up and I have dropbox to share my scripts between multiple computers. 
;This second part makes it easy to position specific active windows on any number of the computers I am working with. Typically I am using my main computer, work laptop with two 49" monitors, 42" tv, one 27" monitor and another monitor that is 24".
;I use a program called synergy to share the single mouse and keyboard with my work computer.
;This was catered to my specific needs.

;Monitor Configuration

; 1 - On top, above the 49ers, I have two 24: monitors - 1920x1080
;Vertically stacked
; 2 - Middle: 49" Curved - 3840x1080
; 3 - Bottom: 49" Curved - 3840x1080
; 4 - to the right of the 49ers, I have a 4k 55" TV

Global coord_x := 0
Global coord_y := 0
Global width := 0
;Global height := (A_ScreenHeight-35) 	;This is for the main screen, to account for the Windows bar
Global height := (A_ScreenHeight) 	;This is for the main screen, to account for the Windows bar
Global ScreenWidthVar := []
Global WidthIncrement := 0

Global zone_x := 0
Global zone_y := 0
Global zone_w := 0
Global zone_h := 0
Global zone_key := 0		;Used to determine which Function Key was used, declaring a spefic zone {F1} through {F12}
Global Limiter_Main := 5760	;This is the width I have set to reset the back to the far left. I may have it hard coded below.
                                ; Also, it is worth noting this is so that the active window can. from left to right, travcerse the 49ers and the 55" TV   

ScreenWidthVar[1] := 1920 ;(A_ScreenWidth/2)   ; Bottom 49" monitor is main
ScreenWidthVar[2] := 1280 ;(A_ScreenWidth/3)   ; 49"monitor is main
ScreenWidthVar[3] := 960 ;(A_ScreenWidth/4)   ; 49"monitor is main
ScreenWidthVar[4] := 640 ;(A_ScreenWidth/6)   ; 49"monitor is main
ScreenWidthVar[5] := 768 ;(A_ScreenWidth/8)   ; 49"monitor is main
ScreenWidthVar[6] := 2560 ;(A_ScreenWidth/3*2) ; 49"monitor is main
;ScreenWidthVar[7] := 1920 ; 27"monitor   ; 49"monitor is main


;FYI - WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
; 3 - Bottom: 49" Curved - 3840x1080 - ****************************************************

	#F1::	;1/2 the screen width, incrementing 1/4 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[1]
			WidthIncrement := ScreenWidthVar[3]
			newWindowPosition_main()
		}
	Return
	
	#F2::	;2/3 the screen width, incrementing 1/6 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[6]
			WidthIncrement := ScreenWidthVar[4]
			newWindowPosition_main()
		}
	Return
	
	#F3::	;1/3 the screen width, incrementing 1/6 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[2]
			WidthIncrement := ScreenWidthVar[4]
			newWindowPosition_main()
		}
	Return

	#F4::	;1/4 the screen width, incrementing 1/4 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[3]
			WidthIncrement := ScreenWidthVar[3]
			newWindowPosition_main()
		}
	Return
	
	#F5::	;1/6 the screen width, incrementing 1/6 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[4]
			WidthIncrement := ScreenWidthVar[4]
			newWindowPosition_main()
		}
	Return
	
	#F6::	;1/8 the screen width, incrementing 1/8 screenwidth - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			Width := ScreenWidthVar[5]
			WidthIncrement := ScreenWidthVar[5]
			newWindowPosition_main()
		}
	Return
	
	#F7::	;Fullscreen, but not technically fullscreen -35 height bottom monitor - bottom (main) monitor
		{
			height := (A_ScreenHeight-35)
			WinMove,A,,0,coord_y,%A_ScreenWidth%,%height%
		}
	Return

; 2 - Middle: 49" Curved - 3840x1080 - ************************************************
	
	^#F1::	;1/2 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[1]
			WidthIncrement := ScreenWidthVar[3]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return

	^!#F1::	;1 1/2 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[1]
			WidthIncrement := ScreenWidthVar[3]
			coord_y := -1080
			height := (A_ScreenHeight*2-35)
			newWindowPosition_second()
		}	
	Return
	
	^#F2::	;2/3 the screen width, incrementing 1/6 screenwidth - top monitor
		{
			Width := ScreenWidthVar[6]
			WidthIncrement := ScreenWidthVar[4]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return

	^!#F2::	;2 1/2 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[6]
			WidthIncrement := ScreenWidthVar[4]
			coord_y := -1080
			height := (A_ScreenHeight*2-35)
			newWindowPosition_second()
		}	
	Return

	
	^#F3::	;1/3 the screen width, incrementing 1/6 screenwidth - top monitor
		{
			Width := ScreenWidthVar[2]
			WidthIncrement := ScreenWidthVar[4]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return

	^!#F3::	;3 1/2 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[2]
			WidthIncrement := ScreenWidthVar[4]
			coord_y := -1080
			height := (A_ScreenHeight*2-35)
			newWindowPosition_second()
		}	
	Return

	^#F4::	;1/4 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[3]
			WidthIncrement := ScreenWidthVar[3]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return
	
	^!#F4::	; 4 1/2 the screen width, incrementing 1/4 screenwidth - top monitor
		{
			Width := ScreenWidthVar[3]
			WidthIncrement := ScreenWidthVar[3]
			coord_y := -1080
			height := (A_ScreenHeight*2-35)
			newWindowPosition_second()
		}	
	Return


	^#F5::	;1/6 the screen width, incrementing 1/6 screenwidth - top monitor
		{
			Width := ScreenWidthVar[4]
			WidthIncrement := ScreenWidthVar[4]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return
	
	^#F6::	;1/8 the screen width, incrementing 1/8 screenwidth - top monitor
		{
			Width := ScreenWidthVar[5]
			WidthIncrement := ScreenWidthVar[5]
			coord_y := -1080
			height := (A_ScreenHeight)
			newWindowPosition_second()
		}
	Return
	
	^#F7::	;Fullscreen, but not technically fullscreen - top monitor
		{
			coord_y := -1080
			height := (A_ScreenHeight)
			WinMove,A,,0,coord_y,%A_ScreenWidth%,%height%
			coord_y := 0
			height := (A_ScreenHeight-35)
		}
	Return

; Special -  ************************************************************************

	#F8::	;Fullscreen between middle and bottom 49" monitors, but not technically fullscreen - spans both monitors
		{
			coord_y := -1080
			height := (A_ScreenHeight*2-35)
			WinMove,A,,0,coord_y,%A_ScreenWidth%,%height%
			coord_y := 0
			height := (A_ScreenHeight-35)
		}
	Return

	#F9::	;Fullscreen between middle and bottom 49" monitors, but not technically fullscreen - spans both monitors
		{
			WinMove,A,,3830,-1100,3835,2160
			
			;coord_y := -1080
			;height := (A_ScreenHeight*2)
			;WinMove,A,,0,coord_y,%A_ScreenWidth%,%height%
			;coord_y := 0
			;height := (A_ScreenHeight)
		}
	Return

;WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
	#F10::	
		{
			;coord_y := -1080
			;height := (A_ScreenHeight*2-35)
			WinMove,A,,-20,-2160,1920,1085
			
			;coord_y := 0
			;height := (A_ScreenHeight)
			;height := (A_ScreenHeight-35)

		}
	Return

;WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText
	#F11::	
		{
			WinMove,A,,1902,-2160,1937,1085

			;coord_y := -2160
			;height := (A_ScreenHeight*2-35)
			;WinMove,A,,900,%coord_y%,1920,1080
			;coord_y := 0
			;height := (A_ScreenHeight)
			;height := (A_ScreenHeight-35)

		}

		;{
		;	Width := ScreenWidthVar[1]
		;	WidthIncrement := ScreenWidthVar[3]
		;	coord_y := -2160
		;	height := (A_ScreenHeight)
		;	twentseveninchMonitor_top()
		;}
	Return

	
		

; Writes to file - ****************************************************************

	^!F10::	;writes the active window coordinates and width to file

	Return
	
	^!F11::	;writes the active window coordinates and width to file

	Return
	
	^!F12::	;writes the active window coordinates and width to file
		{
			zone_key := 12
			wZone()
		}
	Return

; Moves - ************************************************************	
	^#F10::	;takes the active window and moves them to the window coordinates and width from file
		{
			zone_key := 10
			mZone()
		}
	Return
	
	^#F11::	;takes the active window and moves them to the window coordinates and width from file
		{
			zone_key := 11
			mZone()
		}
	Return
	
	^#F12::	;takes the active window and moves them to the window coordinates and width from file
		{
			zone_key := 12
			mZone()
		}
	Return
	
Return

newWindowPosition_main()
	{
		WinMove,A,,coord_x,coord_y,width,height
		coord_x := coord_x + WidthIncrement
		;MsgBox, %Limiter_Main%
		if coord_x >= 7680 ;%A_ScreenWidth%
	
			{
				coord_x := 0
			}
	Return
	}

newWindowPosition_second()
	{
		WinMove,A,,coord_x,coord_y,width,height
		coord_x := coord_x + WidthIncrement
		if coord_x >= 7680 ;%A_ScreenWidth%
	
			{
				coord_x := 0
			}
		coord_y := 0
		height := (A_ScreenHeight-35)
		Return
	}

twentseveninchMonitor_top()
	{
		WinMove,A,,coord_x,coord_y,width,height
		coord_x := coord_x + WidthIncrement
		if coord_x >= %A_ScreenWidth%
	
			{
				coord_x := 0
			}
		coord_y := 0
		height := (A_ScreenHeight)
		Return
	}



Return

fread()
	{
	if FileExist(Config_File)  ;check to see if the config file exists
		{
			Try  	;Try to read the configurations from the .ini file
			{
				;IniRead, OutputVar, Filename, Section, Key
				IniRead, zone_x, %Config_File%, Area1%zone_key%, %zone_key%
				IniRead, zone_y, %Config_File%, Area2%zone_key%, %zone_key%
				IniRead, zone_w, %Config_File%, Area3%zone_key%, %zone_key%
				IniRead, zone_h, %Config_File%, Area4%zone_key%, %zone_key%
			}
			Catch e  ;catch all errors
			{
				Msgbox,48, Error, There was an ERROR reading the saved config file.  ;msg thown on read/access error
			}
		}
	}

fwrite()
	{
		;ProgramExit:
		;on program exit, try to write whatever you want to save to the .ini config file.  Can do other stuff in the sub as well, if needed
		Try
			{
				;IniWrite, Value, Filename, Section, Key
				IniWrite, %zone_x%, %Config_File%, Area1%zone_key%, %zone_key% 	;write to the .ini config file
				IniWrite, %zone_y%, %Config_File%, Area2%zone_key%, %zone_key%
				IniWrite, %zone_w%, %Config_File%, Area3%zone_key%, %zone_key%
				IniWrite, %zone_h%, %Config_File%, Area4%zone_key%, %zone_key%
				;.....
				;note: look for notes at the top about using loops
			}
		Catch e
			{
				Msgbox,48, Error, There was an ERROR writing to/creating the config file, on exit.  ;msg thown on read/access error
			}
		;ExitApp
	}

wZone()
	{
		WinGetActiveStats, Title, Width, Height, X, Y
		zone_x := X
		zone_w := Width
		zone_y := Y
		zone_h := Height
		fwrite()
		;MsgBox, wrote to file x = %zone_x% and y = %zone_y% and width = %zone_w% and finally height = %zone_h%
		Return
	}

mZone()
	{
		fread()
		;MsgBox, Passed the fread function.
		WinMove,A,,zone_x,zone_y,zone_w,zone_h 
		;MsgBox, x = %zone_x% and y = %zone_y% and width = %zone_w% and finally height = %zone_h%
		fwrite()
		Return
	}
Return

;MsgBox, "Screenwidth is %A_ScreenWidth%, x is: %coord_x%, y is %coord_y%, window width is %width% and the WidthIncrement is %WidthIncrement%"

