#Persistent
#SingleInstance force

;; tiling window manager for windows 7-10 designed for 1 or 2 monitors arranging
;; windows in the following pattern with configurable window sizes and borders:
;;  _________     _________
;; |   |     |   |     |___| <- primary monitor
;; |   |     |   |     |   |
;; '---i-----'   '-----i---'

;; todo override windows move keys, eg, win + left

;; -- window sizing options

;; size of space between windows
windowBorder = 10
;; width of the large windows that appear closest to the center of the screen
windowLeftWidth = 1200
;; height of the small top right window
windowRightSmallTopHeight = 550

;; monitor geometry
;; todo: automate this
monitorBorderRight = 1920
monitorBorderLeft = 0
monitorWidth = 1920
monitorHeight = 1080
taskbarHeight = 30

;; adjustment syntax
;; todo: make it work
global windowOverrides                            := Object()
windowOverrides["explorer.exe"]                   := Object()
windowOverrides["explorer.exe"]["left"]           := -8
windowOverrides["explorer.exe"]["top"]            := 0
windowOverrides["explorer.exe"]["width"]          := +16
windowOverrides["explorer.exe"]["height"]         := +8

windowOverrides["atom.exe"]                   := Object()
windowOverrides["atom.exe"]["left"]           := -8
windowOverrides["atom.exe"]["top"]            := 0
windowOverrides["atom.exe"]["width"]          := +16
windowOverrides["atom.exe"]["height"]         := +8

windowOverrides["chrome.exe"]                   := Object()
windowOverrides["chrome.exe"]["left"]           := -8
windowOverrides["chrome.exe"]["top"]            := 0
windowOverrides["chrome.exe"]["width"]          := +16
windowOverrides["chrome.exe"]["height"]         := +8

windowOverrides["firefox.exe"]                   := Object()
windowOverrides["firefox.exe"]["left"]           := -6
windowOverrides["firefox.exe"]["top"]            := 0
windowOverrides["firefox.exe"]["width"]          := +12
windowOverrides["firefox.exe"]["height"]         := +6

windowOverrides["putty.exe"]                   := Object()
windowOverrides["putty.exe"]["left"]           := -4
windowOverrides["putty.exe"]["top"]            := 0
windowOverrides["putty.exe"]["width"]          := +8
windowOverrides["putty.exe"]["height"]         := +4

windowOverrides["WinSCP.exe"]                   := Object()
windowOverrides["WinSCP.exe"]["left"]           := -8
windowOverrides["WinSCP.exe"]["top"]            := 0
windowOverrides["WinSCP.exe"]["width"]          := +16
windowOverrides["WinSCP.exe"]["height"]         := +8

windowOverrides["pidgin.exe"]                   := Object()
windowOverrides["pidgin.exe"]["left"]           := -8
windowOverrides["pidgin.exe"]["top"]            := 0
windowOverrides["pidgin.exe"]["width"]          := +16
windowOverrides["pidgin.exe"]["height"]         := +8

SysGet, MonitorCount, MonitorCount
SysGet, MonitorPrimary, MonitorPrimary
;;MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
Loop, %MonitorCount%
{
    SysGet, MonitorName, MonitorName, %A_Index%
    SysGet, Monitor, Monitor, %A_Index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
    ;;MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
}

;; what happens when:

;; -- TaskbarMontior1 Montitor2
;; -- TaskbarMonitor2 Monitor1

;; -- Monitor1 TaskbarMonitor2
;; -- Monitor2 TaskbarMontior1
;; * Monitor2: -1920
;; * Monitor1: 0


;;calculated variables used below
windowHeightTall := monitorHeight - (windowBorder * 2)
windowHeightTallTaskbar := monitorHeight - (windowBorder * 2) - taskbarHeight
windowRightWidth := monitorWidth - windowLeftWidth - (windowBorder * 3)

;;  _________     _________
;; |   |     |   |     |___| -- LeftLeft
;; | X |     |   |     |   |
;; '---i-----'   '-----i---'
LeftLeftWidth := windowRightWidth
LeftLeftHeight := windowHeightTall
LeftLeftLeft := monitorBorderLeft + windowBorder - monitorWidth
LeftLeftTop := windowBorder

;;  _________     _________
;; |   |     |   |     |___| -- LeftRight
;; |   |  X  |   |     |   |
;; '---i-----'   '-----i---'
LeftRightWidth := windowLeftWidth
LeftRightHeight := windowHeightTall
LeftRightLeft := windowRightWidth + (windowBorder * 2) - monitorWidth
LeftRightTop := windowBorder

;;  _________     _________
;; |   |     |   |     |___| -- RightLeft
;; |   |     |   |  X  |   |
;; '---i-----'   '-----i---'
RightLeftWidth := windowLeftWidth
RightLeftHeight := windowHeightTallTaskbar
RightLeftLeft := windowBorder
RightLeftTop := windowBorder

;;  _________     _________
;; |   |     |   |     |   | -- RightRight
;; |   |     |   |     | X |
;; '---i-----'   '-----i---'
RightRightWidth := windowRightWidth
RightRightHeight := windowHeightTallTaskbar
RightRightLeft := windowLeftWidth + (windowBorder * 2)
RightRightTop := windowBorder

;;  _________     _________
;; |   |     |   |     |_X_| -- RightRightTop
;; |   |     |   |     |   |
;; '---i-----'   '-----i---'
RightRightTopWidth := windowRightWidth
RightRightTopHeight := windowRightSmallTopHeight
RightRightTopLeft := windowLeftWidth + (windowBorder * 2)
RightRightTopTop := windowBorder

;;  _________     _________
;; |   |     |   |     |___| -- RightRightTop
;; |   |     |   |     | X |
;; '---i-----'   '-----i---'
RightRightBotWidth := windowRightWidth
RightRightBotHeight := monitorHeight - taskbarHeight - (windowBorder * 3) - windowRightSmallTopHeight
RightRightBotLeft := windowLeftWidth + (windowBorder * 2)
RightRightBotTop := windowRightSmallTopHeight + (windowBorder * 2)

;; simplified winmove function call
ResizeWinMine(Width = 0,Height = 0, MyLeft = 0, MyTop = 0)
{
    WinGetPos,X,Y,W,H,A

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H


    tmpArray := windowOverrides
    ;;PrintArray(tmpArray)
    For index, value in tmpArray{
      ;;MsgBox, index:`t%index%`n
      if(WinActive("ahk_exe" . index)){
        MyLeft := MyLeft + windowOverrides[index]["left"]
        MyTop := MyTop + windowOverrides[index]["top"]
        Width := Width + windowOverrides[index]["width"]
        Height := Height + windowOverrides[index]["height"]
        ;;MsgBox, MyLeft:`t%MyLeft%`n | MyTop:`t%MyTop% | Width:`t%Width% | Height:`t%Height%
      }
    }

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%

}

;; configure menu
Menu, Tray, Icon , icon.ico
Menu, tray, NoStandard
Menu, Tray, Add, Exit, Exit
Menu, Tray, Add
Menu, Tray, Add, &Left Left Small, LeftLeft
Menu, Tray, Add, &Left Right Large, LeftRight
Menu, Tray, Add
Menu, Tray, Add, &Right Left Large, LeftLarge
Menu, Tray, Add, &Right Right Small, RightSmall
Menu, Tray, Add
Menu, Tray, Add, &Right Right Small Top, RightSmallTop
Menu, Tray, Add, &Right Right Small Bottom, RightSmallBottom

;; keyboard shortcuts
#a::ResizeWinMine(LeftLeftWidth,LeftLeftHeight, LeftLeftLeft, LeftLeftTop)
#s::ResizeWinMine(LeftRightWidth,LeftRightHeight, LeftRightLeft, LeftRightTop)

#q::ResizeWinMine(RightLeftWidth,RightLeftHeight, RightLeftLeft, RightLeftTop)
#w::ResizeWinMine(RightRightWidth,RightRightHeight, RightRightLeft, RightRightTop)
#e::ResizeWinMine(RightRightTopWidth,RightRightTopHeight, RightRightTopLeft, RightRightTopTop)
#d::ResizeWinMine(RightRightBotWidth,RightRightBotHeight, RightRightBotLeft, RightRightBotTop)

;; menu items
;; for the menu we have to activate the previos window (may not be perfect in all case)
;; because the tray popup itself counts as a window
Exit:
ExitApp

LeftLeft:
Send !{Esc} ; Activate previous window
ResizeWinMine(LeftLeftWidth,LeftLeftHeight, LeftLeftLeft, LeftLeftTop)
return

LeftRight:
Send !{Esc} ; Activate previous window
ResizeWinMine(LeftRightWidth,LeftRightHeight, LeftRightLeft, LeftRightTop)
return

LeftLarge:
Send !{Esc} ; Activate previous window
ResizeWinMine(RightLeftWidth,RightLeftHeight, RightLeftLeft, RightLeftTop)
return

RightSmall:
Send !{Esc} ; Activate previous window
ResizeWinMine(RightRightWidth,RightRightHeight, RightRightLeft, RightRightTop)
return

RightSmallTop:
Send !{Esc} ; Activate previous window
ResizeWinMine(RightRightTopWidth,RightRightTopHeight, RightRightTopLeft, RightRightTopTop)
return

RightSmallBottom:
Send !{Esc} ; Activate previous window
ResizeWinMine(RightRightBotWidth,RightRightBotHeight, RightRightBotLeft, RightRightBotTop)
return
