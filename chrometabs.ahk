#Persistent ; Keep the script running
SetTitleMatchMode, 2 ; Allow for partial matching of window titles
;test_20240812
; Replace these URLs with the websites you want to open
Website1 := "https://www.churchofjesuschrist.org/my-home/dashboard?lang=eng"
Website2 := "https://fullscreen-for-googletasks.com/"
Website3 := "https://keep.google.com/u/0/?pli=1#home"
Website4 := "https://voice.google.com/u/0/about
Website5 := "https://calendar.google.com/calendar/u/0/r?pli=1
Website6 := "https://drive.google.com/drive/u/0/my-drive
Website7 := "https://contacts.google.com/?pli=1
Website8 := "https://photos.google.com/
Website9 := "https://home.nest.com/login/?next=https%3A%2F%2Fhome.nest.com%2Fhome%2Fc69b5ce0-48d4-11ec-b3a3-0ae468c0a0f6
Website10 := "https://home.google.com/u/0/home/1-c8ae7d9d01ca3b9174b59a47e64a2a9c20c72f8815747d3e34a2e1b7378ca27d/cameras/grid
Website11 := "https://www.facebook.com/
Website12 := "https://web.groupme.com/signin
Website13 := "https://www.amazon.com/gp/new-releases/?ref_=nav_em_cs_newreleases_0_1_1_3
Website14 := "https://mail.google.com/mail/u/0/?ogbl#inbox

^!c:: ; Ctrl + Alt + C hotkey to open websites
    Run, chrome.exe
    WinWaitActive, ahk_exe chrome.exe

    ; Open the first website in a new tab
    Send, ^t
    Sleep, 500
    Send, %Website1%
    Send, {Enter}

    ; Open the second website in a new tab
    Sleep, 500
    Send, ^t
    Sleep, 500
    Send, %Website2%
    Send, {Enter}

    ; Open the third website in a new tab
    Sleep, 500
    Send, ^t
    Sleep, 500
    Send, %Website3%
    Send, {Enter}

return