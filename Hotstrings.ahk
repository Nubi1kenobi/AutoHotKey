#NoEnv				; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input			; Recommended for new scripts due to its superior speed and reliability.
FormatTime, CurrentDateTime,, MM/dd/yy HH:mm

;;;;Work Specific Hotstrings
;^i::
;	SendInput, {Enter 1}
;	Sleep 250
;	SendInput, {Left 1}{Right 3}7
;	Sleep 250
;	SendInput, {Del 1}{Enter 1}{Down 1}
;	Sleep 250

^i::
{
	SendInput,	{F2 1}{Home 1}{Right 1}{Del 2}{Enter 1}
	Sleep 250
	Return
}


Return

; #t::Run, %A_ScriptDir%/Timestamper2.ahk
;:o*:/out::FAN CONTINOUS DURING OCCUPIED - NEW UNIT HAS VFD 20210928
;:o*:/cout:: 
;{
;	SendInput, cout.setf(ios::fixed);{space 6}//no scientific notation please{enter}
;	SendInput, cout.setf(ios::showpoint);{space 2}//always show the decimal for real numbers{enter}
;	SendInput, cout.precision(2);{space 10}//two digits after the decimal{enter}
;}
;Return


;:o*:/80::
;{
;Loop;
; {
;		SendInput, {LAlt down}{Numpad4}{Numpad2}{LAlt up}
;		Sleep, 10
;		if (A_Index = 80)
;			break ;terminate loop
;	}
;}
;:o*:/N1::FORTH WORTH, TX{ENTER 1}UNIVERSITY PARK VILLIAGE{ENTER 1}{SPACE 1}{ENTER 1}

;#IfWinActive ahk_class AfxMDIFrame140u
;:o*:/P1::VET CARE EXPANSION AND BAS UPGRADE{TAB 1}06/09/2021{TAB 1}BCS{TAB 47}06/09/2021{TAB 1}2021{TAB 18}06/09/2021{TAB 4}PETCO - 1138{TAB 1}PHOENIX, AZ{ENTER 1}
;:o*:/P2::UNIT REPLACEMENT AND BAS UPGRADE{TAB 1}05/24/2021{TAB 1}BCS{TAB 47}05/24/2021{TAB 1}2021{TAB 18}05/24/2021{TAB 4}PETCO - 541{TAB 1}WESTMINSTER, CA{ENTER 1}
;:o*:/P3::UNIT REPLACEMENT{TAB 1}05/28/2021{TAB 1}BCS{TAB 47}05/28/2021{TAB 1}2021{TAB 18}05/28/2021{TAB 4}PETCO - 309{TAB 1}UNION CITY, CA{ENTER 1}
;:o*:/P4::VET CARE EXPANSION AND BAS UPGRADE{TAB 1}06/08/2021{TAB 1}BCS{TAB 47}06/08/2021{TAB 1}2021{TAB 18}06/08/2021{TAB 4}PETCO - 1980{TAB 1}NORRIDGE, IL{ENTER 1}
;RETURN
;
;#IfWinNotActive ahk_class AfxMDIFrame140u
;Return

;   %A_MM%/%A_DD%/%A_YYYY%

:o*:/bry1::Bryan.Stauch@ExpanseElectrical.com
:o*:/bry2::Bryan.Stauch@Gmail.Com
:o*:/bry2::Bryan.Stauch.Expanse@Gmail.Com
:o*:/pass1::Expanse@3002{Enter 1}
:o*:/pass2::Igottwo49"monitors!{Enter 1}
:o*:/Odie::Audon.Saldivar@expanseelectrical.com

  
;;Email Endings
:o*:/quest1::Please let us know if you have any questions; thank you.
:o*:/quest2::Please let me know if you have any questions; thank you.

 
;;General

:o*:/wo::
  SendRaw, Work Order#:
  SendInput, {Space}
Return
:o*:/gtg::gtgauto{Tab 1}GTG4842{Tab 1}{Space 1}
:o*:/emp::Bryan Stauch - 011320
:o*:/dl::download
:o*:morngin::morning
::/cfm::condenser fan motor
::evap::evaporator
:o*:havc::HVAC
::comp::compressor
::cond::condenser
::fixg::fixing
:o*:mnt::maintenance 
::mnto::maintenance override
::occ::occupied
::unocc::unoccupied
:o:occu::occupied
:o:unoccu::unoccupied
::resp::responding
::verif::verified proper operation.
::vm::voicemail
::ul::upload
::af::airflow
:o*:afs::airflow switch
::ref::reference
:o*:/perm::permanent
:o*:tempy::temporary
:o*:tempr::temperature
:o*:coef::communication coefficient
:o*:sati::satisfied
:o*:tstat::thermostat
:o*:t-stat::thermostat
:o*:fyi::FYI





Return 
  
