#Persistent
Menu, Tray, Icon , icon.ico
Menu, tray, NoStandard
Menu, Tray, Add, Exit, Exit
Menu, Tray, Add
Menu, Tray, Add, &Right Left Large, LeftLarge
Menu, Tray, Add, &Right Right Small, RightSmall
Menu, Tray, Add
Menu, Tray, Add, &Right Right Small Top, RightSmallTop
Menu, Tray, Add, &Right Right Small Bottom, RightSmallBottom
Menu, Tray, Add
Menu, Tray, Add, &Left Left Small, LeftLeft
Menu, Tray, Add, &Left Right Large, LeftRight

GetTaskBarLocation()
{
  RegRead, TaskBarSettings, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects2, Settings

  if (SubStr(TaskBarSettings, 26, 1) = 0)
   {
     TaskBarLocation := "LEFT"
     return TaskBarLocation
   }
  if (SubStr(TaskBarSettings, 26, 1) = 1)
   {
     TaskBarLocation := "TOP"
     return TaskBarLocation
   }
  if (SubStr(TaskBarSettings, 26, 1) = 2)
   {
     TaskBarLocation := "RIGHT"
     return TaskBarLocation
   }
  if (SubStr(TaskBarSettings, 26, 1) = 3)
   {
     TaskBarLocation := "BOTTOM"
     return TaskBarLocation
   }
}

ResizeWinMine(Width = 0,Height = 0, MyLeft = 0, MyTop = 0)
{

  If(WinActive("ahk_exe emacs.exe")){

  } else {
    if (GetTaskBarLocation() = "BOTTOM"){
      MyTop := MyTop - 35
    }
    WinGetPos,X,Y,W,H,A

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
  }
}

ResizeWinMineEmacs(Width = 0,Height = 0, MyLeft = 0, MyTop = 0)
{
  If(WinActive("ahk_exe emacs.exe")){
    WinGetPos,X,Y,W,H,A

    if (GetTaskBarLocation() = "BOTTOM"){
      MyTop := MyTop - 35
    }

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
  } else {
    WinGetPos,X,Y,W,H,A

    MyTop := MyTop + 4
    Height := Height - 4

    if (GetTaskBarLocation() = "BOTTOM"){
      MyTop := MyTop - 35
    }

    MyLeft := MyLeft + 6
    Width := Width - 6

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
  }
}

ResizeWinMineEmacsLeft(Width = 0,Height = 0, MyLeft = 0, MyTop = 0)
{
  If(WinActive("ahk_exe emacs.exe")){
    WinGetPos,X,Y,W,H,A

    if (GetTaskBarLocation() = "BOTTOM"){
      MyTop := MyTop - 35
    }

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
  } else {
    WinGetPos,X,Y,W,H,A

    ;;MyTop := MyTop + 4
    Height := Height - 2

    if (GetTaskBarLocation() = "BOTTOM"){
      MyTop := MyTop - 35
    }

    ;;MyLeft := MyLeft + 6
    ;;Width := Width - 6

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
  }
}


;; Width = 0,Height = 0, MyLeft = 0, MyTop = 0
;; Order of functions

;; Left Large
#q::ResizeWinMineEmacs(1200,1031, 4, 40)
;; Right Small
#w::ResizeWinMine(696,1027, 1213, 44)
;; Right Top Small
#e::ResizeWinMine(696,498, 1213, 44)
;; Right Bot Small
#d::ResizeWinMine(696,520, 1213, 551)

;; Left Monitor Left Side Small
#a::ResizeWinMine(696,1060, -1912, 44)
;; Left Monitor Right Side Large
#s::ResizeWinMineEmacsLeft(1196,1062, -1205, 44)

Exit:
ExitApp

LeftLarge:
Send !{Esc} ; Activate previous window
ResizeWinMineEmacs(1200,1031, 4, 40)
return

RightSmall:
Send !{Esc} ; Activate previous window
ResizeWinMine(696,1027, 1213, 44)
return

RightSmallTop:
Send !{Esc} ; Activate previous window
ResizeWinMine(696,498, 1213, 44)
return

RightSmallBottom:
Send !{Esc} ; Activate previous window
ResizeWinMine(696,520, 1213, 551)
return

LeftLeft:
Send !{Esc} ; Activate previous window
ResizeWinMine(696,1060, -1912, 44)
return

LeftRight:
Send !{Esc} ; Activate previous window
ResizeWinMineEmacsLeft(1196,1062, -1205, 44)
return
