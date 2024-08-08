#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input 			; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1
FormatTime, CurrentDateTime,, MM/dd/yy HH:mm
SetBatchLines -1

;--------------------------------------Table Of Contents----------------------------------------------------Begin
;(1.) Declaration of Global Variables
;(2.) "Must Have" shortcuts
;(6.) FunctionsBegin
;(7.) Global Functions
;(8.) FieldPoint_Ticket_Template_Functions
;--------------------------------------Table Of Contents----------------------------------------------------End

;--------------------------------------(1.) Declaration of Global Variables-------------------------------------------Begin
Global pageN1 := " "
Global pageN2 := " "
Global pageN3 := " " 
Global pageN4 := " " 
Global pageN5 := " " 
Global pageN6 := " " 
Global pageN7 := " " 
Global pageN8 := " " 
Global pageN9 := " "
Global pageN0 := " " 
;--------------------------------------Declaration of Global Variables-------------------------------------------End
;--------------------------------------(2.) "Must Have" shortcuts------------------------------------------------Begin
	^g::Run, chrome.exe www.google.com
	;#^g::
	;#n::Run, notepad.exe
	#s::Run, C:\Program Files\Sublime Text 3\sublime_text.exe
	#c::Run, calc.exe
;--------------------------------------"Must Have" shortcuts------------------------------------------------End
;------------------------------------------(6.) Globals-----------------------------------------------------------------Begin

	^!z::WipeClipboards()
	#z::MsgBox, "%pageN1%, %pageN2%, %pageN3%, %pageN4%, %pageN5%" 

;Macro/Function Map
	;^Right::RESERVED - Global NAV
	;!Right::RESERVED - Global NAV
	;#Right::RESERVED - Dashboard_Script
	;^!Right::
	;#^Right::RESERVED - Global NAV
	;#!Right::
	;#^!Right::

	;^Left::RESERVED - Global NAV
	;!Left::RESERVED - Global NAV
	;#Left::
	;^!Left::
	;#^Left::
	;#!Left::
	;#^!Left::

	;^Up::RESERVED - Global NAV
	;!Up::RESERVED - Global NAV
	;#Up::RESERVED - Dashboard_Script
	;^!Up::
	;#^Up::
	;#!Up::
	;#^!Up::

	;^Down::RESERVED - Global NAV
	;!Down::RESERVED - Global NAV
	;#Down::
	;^!Down::
	;#^Down::
	;#!Down::
	;#^!Down::

	#1::Clipboard_1()
	#2::Clipboard_2()
	#3::Clipboard_3()
	#4::Clipboard_4()
	#5::Clipboard_5()
	#6::Clipboard_6()
	#7::Clipboard_7()
	#8::Clipboard_8()
	#9::Clipboard_9()
	#0::Clipboard_0()

	;^1::RESERVED - Frequently Used Microsoft Excel Shortcut
	;^2:: 
	;^3:: 
	;^4:: 
	;^5:: 
	;^6:: 
	;^7:: 
	;^8:: 
	;^9:: 
	;^0:: 

	;!1::
	;!2::
	;!3::
	;!4::
	;!5::
	;!6::
	;!7::
	;!8::
	;!9::
	;!0::

	^!1::Send, %pageN1%
	^!2::Send, %pageN2%
	^!3::Send, %pageN3%
	^!4::Send, %pageN4%
	^!5::Send, %pageN5%
	^!6::Send, %pageN6%
	^!7::Send, %pageN7%
	^!8::Send, %pageN8%
	^!9::Send, %pageN9%
	^!0::Send, %pageN0%

	#IfWinActive ahk_class Chrome_WidgetWin_1
		{
			#^1::LaunchChromeTabs_Google()
			#^2::LaunchChromeTabs_Church()
			;#^3::
			;#^4::
			;#^5::
			;#^6::
			;#^7::
			;#^8::
			;#^9::
			;#^0::
		}
	;#!1::Reserved for Menu.ahk
	;#!2::Reserved for Menu.ahk
	;#!3::Reserved for Menu.ahk
	;#!4::Reserved for Menu.ahk
	;#!5::Reserved for Menu.ahk
	;#!6::Reserved for Menu.ahk
	;#!7::Reserved for Menu.ahk
	;#!8::Reserved for Menu.ahk
	;#!9::Reserved for Menu.ahk
	;#!0::Reserved for Menu.ahk

	;#!^1::
	;#!^2::
	;#!^3::
	;#!^4::
	;#!^5::
	;#!^6::
	;#!^7::
	;#!^8::
	;#!^9::
	;#!^0::

	;#numpad1::
	;#numpad2::
	;#numpad3::
	;#numpad4::
	;#numpad5::
	;#numpad6::
	;#numpad7::
	;#numpad8::
	;#numpad9::
	;#numpad0::

	;^numpad1::
	;^numpad2::
	;^numpad3::
	;^numpad4::
	;^numpad5::
	;^numpad6::
	;^numpad7::
	;^numpad8::
	;^numpad9::
	;^numpad0::

	;!numpad1::
	;!numpad2::
	;!numpad3::
	;!numpad4::
	;!numpad5::
	;!numpad6::
	;!numpad7::
	;!numpad8::
	;!numpad9::
	;!numpad0::

	;^!numpad1::
	;^!numpad2::
	;^!numpad3::
	;^!numpad4::
	;^!numpad5::
	;^!numpad6::
	;^!numpad7::
	;^!numpad8::
	;^!numpad9::
	;^!numpad0::

	;#^numpad1::
	;#^numpad2::
	;#^numpad3::
	;#^numpad4::
	;#^numpad5::
	;#^numpad6::
	;#^numpad7::
	;#^numpad8::
	;#^numpad9::
	;#^numpad0::

	;#!numpad1::
	;#!numpad2::
	;#!numpad3::
	;#!numpad4::
	;#!numpad5::
	;#!numpad6::
	;#!numpad7::
	;#!numpad8::
	;#!numpad9::
	;#!numpad0::

	;#!^numpad1::
	;#!^numpad2::
	;#!^numpad3::
	;#!^numpad4::
	;#!^numpad5::
	;#!^numpad6::
	;#!^numpad7::
	;#!^numpad8::
	;#!^numpad9::
	;#!^numpad0::

	;#{F1}::Reserved for Window Resizer
	;#{F2}::Reserved for Window Resizer
	;#{F3}::Reserved for Window Resizer
	;#{F4}::Reserved for Window Resizer
	;#{F5}::Reserved for Window Resizer
	;#{F6}::Reserved for Window Resizer
	;#{F7}::Reserved for Window Resizer
	;#{F8}::Reserved for Window Resizer
	;#{F9}::Reserved for Window Resizer
	;#{F10}::Reserved for Window Resizer
	;#{F11}::Reserved for Window Resizer
	;#{F12}::Reserved for Window Resizer

	;+#{F1}::Reserved for Window Resizer
	;+#{F2}::Reserved for Window Resizer
	;+#{F3}::Reserved for Window Resizer
	;+#{F4}::Reserved for Window Resizer
	;+#{F5}::Reserved for Window Resizer
	;+#{F6}::Reserved for Window Resizer
	;+#{F7}::Reserved for Window Resizer
	;+#{F8}::Reserved for Window Resizer
	;+#{F9}::Reserved for Window Resizer
	;+#{F10}::Reserved for Window Resizer
	;+#{F11}::Reserved for Window Resizer
	;+#{F12}::Reserved for Window Resizer


	;^{F1}::
	;^{F2}::
	;^{F3}::
	;^{F4}::
	;^{F5}::
	;^{F6}::
	;^{F7}::
	;^{F8}::
	;^{F9}::
	;^{F10}::
	;^{F11}::
	;^{F12}::


	;!{F1}::
	;!{F2}::
	;!{F3}::
	;!{F4}::
	;!{F5}::
	;!{F6}::
	;!{F7}::
	;!{F8}::
	;!{F9}::
	;!{F10}::
	;!{F11}::
	;!{F12}::


	;^!{F1}::Reserved for Window Resizer
	;^!{F2}::Reserved for Window Resizer
	;^!{F3}::Reserved for Window Resizer
	;^!{F4}::Reserved for Window Resizer
	;^!{F5}::Reserved for Window Resizer
	;^!{F6}::Reserved for Window Resizer
	;^!{F7}::Reserved for Window Resizer
	;^!{F8}::Reserved for Window Resizer
	;^!{F9}::Reserved for Window Resizer
	;^!{F10}::Reserved for Window Resizer
	;^!{F11}::Reserved for Window Resizer
	;^!{F12}::Reserved for Window Resizer


	;#^{F1}::
	;#^{F2}::
	;#^{F3}::
	;#^{F4}::
	;#^{F5}::
	;#^{F6}::
	;#^{F7}::
	;#^{F8}::
	;#^{F9}::
	;#^{F10}::
	;#^{F11}::
	;#^{F12}::


	;#!{F1}::
	;#!{F2}::
	;#!{F3}::
	;#!{F4}::
	;#!{F5}::
	;#!{F6}::
	;#!{F7}::
	;#!{F8}::
	;#!{F9}::
	;#!{F10}::
	;#!{F11}::
	;#!{F12}::


	;#^!{F1}::Reserved for Window Resizer
	;#^!{F2}::Reserved for Window Resizer
	;#^!{F3}::Reserved for Window Resizer
	;#^!{F4}::Reserved for Window Resizer
	;#^!{F5}::Reserved for Window Resizer
	;#^!{F6}::Reserved for Window Resizer
	;#^!{F7}::Reserved for Window Resizer
	;#^!{F8}::Reserved for Window Resizer
	;#^!{F9}::Reserved for Window Resizer
	;#^!{F10}::Reserved for Window Resizer
	;#^!{F11}::Reserved for Window Resizer
	;#^!{F12}::Reserved for Window Resizer

	;Joy1:: 
	;Joy2::
	;Joy3::
	;Joy4::
	;Joy5::
	;Joy6::
	;Joy7::
	;Joy8::
	;Joy9::
	;Joy10::
	;Joy11::EscapeKeyRemap()
	;Joy12::
	;Joy13::
	;Joy14::
	;Joy15::
	;Joy16::
	;Joy17::
	;Joy18::
	;Joy19::
	;Joy20::
	;Joy21:: Does Not Work
;------------------------------------------Globals-----------------------------------------------------------------End
Return ;End Script

;----------------------------------------------(7.) Global Functions----------------------------------------------------
	EscapeKeyRemap()
	{
		SendInput, {ESC 1};
		Return
	}
	WipeClipboards()
	{
	Global pageN1 := " "
	Global pageN2 := " "
	Global pageN3 := " " 
	Global pageN4 := " " 
	Global pageN5 := " " 
	Global pageN6 := " " 
	Global pageN7 := " " 
	Global pageN8 := " " 
	Global pageN9 := " "
	Global pageN0 := " " 	
	MsgBox, "You have wiped all of the clipboards."
	}

	Clipboard_1()
	{
		Send, ^c
		Sleep 150
		pageN1 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_2()	
	{
		Send, ^c
		Sleep 150
		pageN2 = %clipboard% ; stores the clipboard content into a variable
		Return
	}	
	Clipboard_3()
	{
		Send, ^c
		Sleep 150
		pageN3 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_4()
	{
		Send, ^c
		Sleep 150
		pageN4 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_5()
	{
		Send, ^c
		Sleep 150
		pageN5 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_6()
	{
		Send, ^c
		Sleep 150
		pageN6 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_7()
	{
		Send, ^c
		Sleep 150
		pageN7 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_8()
	{
		Send, ^c
		Sleep 150
		pageN8 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_9()
	{
		Send, ^c
		Sleep 150
		pageN9 = %clipboard% ; stores the clipboard content into a variable
		Return
	}
	Clipboard_0()
	{
		Send, ^c
		Sleep 150
		pageN0 = %clipboard% ; stores the clipboard content into a variable
		Return
	}

	LaunchChromeTabs_Google()
	{
		sites := ["https://fullscreen-for-googletasks.com/", "https://keep.google.com/u/0/?pli=1#home", "https://calendar.google.com/calendar/u/0/r?pli=1", "https://voice.google.com/u/0/messages", "https://drive.google.com/drive/u/0/my-drive", "https://contacts.google.com/?pli=1", "https://photos.google.com/", "https://home.nest.com/login/?next=https%3A%2F%2Fhome.nest.com%2Fhome%2Fc69b5ce0-48d4-11ec-b3a3-0ae468c0a0f6", "https://home.google.com/u/0/home/1-c8ae7d9d01ca3b9174b59a47e64a2a9c20c72f8815747d3e34a2e1b7378ca27d/cameras/grid", "https://gmail.com"] ; List of websites to open
		Loop % sites.MaxIndex() ; Loop through the list of websites
			{
				Send, ^t
				Sleep 500
				Send % sites[A_Index] "{Enter 1}" ; Replace "ProfileName" with the name of your Chrome profile
				Sleep 500 ; Wait a bit before opening the next tab
			}
	}
	
	LaunchChromeTabs_Church()
	{
				sites := ["https://www.churchofjesuschrist.org/my-home?lang=eng", "https://fullscreen-for-googletasks.com/", "https://calendar.google.com/calendar/u/0/r?pli=1", "https://gmail.com", "https://drive.google.com/drive/u/0/my-drive"] ; List of websites to open
				Loop % sites.MaxIndex() ; Loop through the list of websites
					{
						Send, ^t
						Sleep 500
						Send % sites[A_Index] "{Enter 1}" ; Replace "ProfileName" with the name of your Chrome profile
						Sleep 750 ; Wait a bit before opening the next tab
					}
	}

;------------------------------------------FunctionsEnd-----------------------------------------------------------------End