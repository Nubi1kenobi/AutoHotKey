 #NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input 			; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%   	; Ensures a consistent starting directory.
DetectHiddenWindows, On
SetBatchLines -1

;configuratuion FileSystem
;^k::Run, %A_ScriptDir%/keyboardConfig.ahk
;^d::MsgBox, %A_ScriptDir%


;Alien Ware Tower
 #^a::
 {
  Run, %A_ScriptDir%/Hotstrings.ahk 
  Run, %A_ScriptDir%/Macro_Library.ahk
  Run, %A_ScriptDir%/New_Window_Resizer20200907.ahk	
  ;Run, %A_ScriptDir%/Pure_Cloud.ahk - not needed
  ;Run, %A_ScriptDir%/MS_Excel.ahk - not needed
  MsgBox All Modules for my Alien Ware tower have been Activated!
 Return
 }

  #^q::
 {
  Run, %A_ScriptDir%/Hotstrings.ahk 
  Run, %A_ScriptDir%/Macro_Library.ahk
  Run, %A_ScriptDir%/New_Window_Resizer20200907_49s.ahk 
  ;Run, %A_ScriptDir%/Pure_Cloud.ahk - not needed
  ;Run, %A_ScriptDir%/MS_Excel.ahk - not needed
  MsgBox All Modules for my Alien Ware tower (49ers) have been Activated!
 Return
 }

 ;Work - Docked Laptop 
 #^w::
  {
  Run, %A_ScriptDir%/BAS_Software.ahk   
  Run, %A_ScriptDir%/Hotstrings.ahk 
  Run, %A_ScriptDir%/Macro_Library.ahk
  Run, %A_ScriptDir%/MS_Excel.ahk
  Run, %A_ScriptDir%/ScreenDancer_DockedLaptop_20210514.ahk
  MsgBox All Modules for my work laptop have been Activated!
 Return
  }

 ;Test Scripts
 #^t::
    Run, %A_ScriptDir%/test_script.ahk
  MsgBox Test_Script has been Activated!
 Return

 #k:: ;Kills all "Child" Scripts
  DetectHiddenWindows,On
  Process, Exist
  OWNPID:=ErrorLevel
  WinGet, ID, List, AHK_class AutoHotkey
  Loop %ID%
  {
     WinGet, PID,PID,% "ahk_id " . ID%A_Index%
     If (PID!=OWNPID){
        WinClose,% "ahk_id " ID%A_Index%
        Process,WaitClose,%PID%,0.3
        If (ErrorLevel){
           WinKill,% "ahk_id " ID%A_Index%
           Process,WaitClose,%PID%,0.3
           If (ErrorLevel){
              WinGetTitle,name,% "ahk_id " ID%A_Index%
              MsgBox,262148,Kill Script,Would you like to kill %name%
              IfMsgBox Yes
                 Process,Close,%PID%
           }
        }
     }
  }

 msgbox Modules Deactivated!
 Return



;Kills Dashboard
 ^#r::
  msgbox Dashboard_Scripts has been shutdown.
  sleep 2000
  Exitapp 
 Return
