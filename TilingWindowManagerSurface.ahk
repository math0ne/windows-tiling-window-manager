#Persistent
#SingleInstance force

;; tiling window manager for windows 7-10 designed for 1 or 2 monitors arranging
;; windows in the following pattern with configurable window sizes and borders:
;;  _________     _________
;; |   |     |   |     |___| <- primary monitor
;; |   |     |   |_____|   |
;; '---i-----'   '-----i---'

;; todo override windows move keys, eg, win + left

;; -- window sizing options

;; size of space between windows
windowBorder = 15
;; width of the large windows that appear closest to the center of the screen
windowLeftWidth = 1770
;; height of the small top right window
windowRightSmallTopHeight = 1100
;; height of the top left main window
windowLeftSmallTopHeight = 1500

;; monitor geometry
;; todo: automate this
monitorBorderRight = 1920
monitorBorderLeft = 0
monitorWidth = 3000
monitorHeight = 2000
taskbarHeight = 52

monitorWidthLeft = 1440
monitorheightRight = 2560

;; override system, here you can define a default offset and specific program offsets
;; this will allow you to setup for custom themes and programs that wont behave
;; I tried to make this work with WinGetPosEx but even that had many faults
global windowOverrides                            := Object()

windowOverrides["default"]                   := Object()
windowOverrides["default"]["left"]           := -11
windowOverrides["default"]["top"]            := 0
windowOverrides["default"]["width"]          := +23
windowOverrides["default"]["height"]         := 0


windowOverrides["firefox.exe"]                   := Object()
windowOverrides["firefox.exe"]["left"]           := -9
windowOverrides["firefox.exe"]["top"]            := 0
windowOverrides["firefox.exe"]["width"]          := +19
windowOverrides["firefox.exe"]["height"]         := +10

windowOverrides["Spotify.exe"]                   := Object()
windowOverrides["Spotify.exe"]["left"]           := +4
windowOverrides["Spotify.exe"]["top"]            := 0
windowOverrides["Spotify.exe"]["width"]          := -4
windowOverrides["Spotify.exe"]["height"]         := -12

windowOverrides["pidgin.exe"]                   := Object()
windowOverrides["pidgin.exe"]["left"]           := -15
windowOverrides["pidgin.exe"]["top"]            := 0
windowOverrides["pidgin.exe"]["width"]          := +33
windowOverrides["pidgin.exe"]["height"]         := +12

windowOverrides["Photoshop.exe"]                   := Object()
windowOverrides["Photoshop.exe"]["left"]           := -2
windowOverrides["Photoshop.exe"]["top"]            := -2
windowOverrides["Photoshop.exe"]["width"]          := 0
windowOverrides["Photoshop.exe"]["height"]         := -10


windowOverrides["ONENOTE.EXE"]                   := Object()
windowOverrides["ONENOTE.EXE"]["left"]           := 0
windowOverrides["ONENOTE.EXE"]["top"]            := 0
windowOverrides["ONENOTE.EXE"]["width"]          := 0
windowOverrides["ONENOTE.EXE"]["height"]         := 0

windowOverrides["slack.exe"]                   := Object()
windowOverrides["slack.exe"]["left"]           := 0
windowOverrides["slack.exe"]["top"]            := 0
windowOverrides["slack.exe"]["width"]          := -2
windowOverrides["slack.exe"]["height"]         := -14

windowOverrides["ConEmu64.exe"]                   := Object()
windowOverrides["ConEmu64.exe"]["left"]           := -15
windowOverrides["ConEmu64.exe"]["top"]            := 0
windowOverrides["ConEmu64.exe"]["width"]          := +30 
windowOverrides["ConEmu64.exe"]["height"]         := +2

windowOverrides["emacs.exe"]                   := Object()
windowOverrides["emacs.exe"]["left"]           := -15
windowOverrides["emacs.exe"]["top"]            := 0
windowOverrides["emacs.exe"]["width"]          := +30 
windowOverrides["emacs.exe"]["height"]         := +2

windowOverrides["Code.exe"]                   := Object()
windowOverrides["Code.exe"]["left"]           := -12
windowOverrides["Code.exe"]["top"]            := 0
windowOverrides["Code.exe"]["width"]          := +24
windowOverrides["Code.exe"]["height"]         := 0




/*
windowOverrides["Steam.exe"]                   := Object()
windowOverrides["Steam.exe"]["left"]           := 1
windowOverrides["Steam.exe"]["top"]            := 1
windowOverrides["Steam.exe"]["width"]          := -2
windowOverrides["Steam.exe"]["height"]         := -2

windowOverrides["explorer.exe"]                   := Object()
windowOverrides["explorer.exe"]["left"]           := -16
windowOverrides["explorer.exe"]["top"]            := 0
windowOverrides["explorer.exe"]["width"]          := +32
windowOverrides["explorer.exe"]["height"]         := +10

windowOverrides["atom.exe"]                   := Object()
windowOverrides["atom.exe"]["left"]           := -16
windowOverrides["atom.exe"]["top"]            := 0
windowOverrides["atom.exe"]["width"]          := +32
windowOverrides["atom.exe"]["height"]         := +10

windowOverrides["chrome.exe"]                   := Object()
windowOverrides["chrome.exe"]["left"]           := -16
windowOverrides["chrome.exe"]["top"]            := 0
windowOverrides["chrome.exe"]["width"]          := +32
windowOverrides["chrome.exe"]["height"]         := +10

windowOverrides["firefox.exe"]                   := Object()
windowOverrides["firefox.exe"]["left"]           := -12
windowOverrides["firefox.exe"]["top"]            := 0
windowOverrides["firefox.exe"]["width"]          := +20
windowOverrides["firefox.exe"]["height"]         := +6

windowOverrides["putty.exe"]                   := Object()
windowOverrides["putty.exe"]["left"]           := -4
windowOverrides["putty.exe"]["top"]            := 0
windowOverrides["putty.exe"]["width"]          := +8
windowOverrides["putty.exe"]["height"]         := +4

windowOverrides["WinSCP.exe"]                   := Object()
windowOverrides["WinSCP.exe"]["left"]           := -16
windowOverrides["WinSCP.exe"]["top"]            := 0
windowOverrides["WinSCP.exe"]["width"]          := +32
windowOverrides["WinSCP.exe"]["height"]         := +10

windowOverrides["pidgin.exe"]                   := Object()
windowOverrides["pidgin.exe"]["left"]           := -16
windowOverrides["pidgin.exe"]["top"]            := 0
windowOverrides["pidgin.exe"]["width"]          := +32
windowOverrides["pidgin.exe"]["height"]         := +10


*/
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

newLeftWindowWidth := monitorWidthLeft - (windowBorder * 2)
newLeftWindowTopHeight := 800
newLeftWindowBotHeight := 1715

vertWindowWidth := monitorHeight - (windowBorder * 2)
vertWindowWTopHeight := 2000
vertWindowWBotHeight := monitorWidth - vertWindowWTopHeight - (windowBorder * 2) - taskbarHeight

newZero := 0

;;  ___     _________
;; | x |   |     |___| -- LeftLeft
;; |   |   |     |   |
;; '---i   '-----i---'
LeftLeftWidth :=  (monitorWidthLeft * 2) - (windowBorder * 2)
LeftLeftHeight := newLeftWindowTopHeight * 2
LeftLeftLeft := (newZero - (monitorWidthLeft * 2) + 15)
LeftLeftTop := - 600

;;  ____    _________
;; |   |   |     |___| -- LeftRight
;; | x |   |     |   |
;; '---i   '-----i---'
LeftRightWidth :=  (monitorWidthLeft * 2) - (windowBorder * 2)
LeftRightHeight := newLeftWindowBotHeight * 2 + (windowBorder * 3)
LeftRighteft := (newZero - (monitorWidthLeft * 2) + 15)
LeftRightTop := - 600 + (newLeftWindowTopHeight * 2) + windowBorder

;;  _________     _________
;; |   |     |   |     |___| -- RightLeft
;; |   |     |   |  X  |   |
;; '---i-----'   '-----i---'
RightLeftWidth := windowLeftWidth
RightLeftHeight := windowHeightTallTaskbar
RightLeftLeft := windowBorder
RightLeftTop := windowBorder

;;  _________     _________
;; |   |     |   |  x  |___| -- RightLeftTop
;; |   |     |   |_____|   |
;; '---i-----'   '-----i---'
RightLeftTopWidth := windowLeftWidth
RightLeftTopHeight := windowLeftSmallTopHeight
RightLeftTopLeft := windowBorder
RightLeftTopTop := windowBorder

;;  _________     _________
;; |   |     |   |     |___| -- RightLeftBottom
;; |   |     |   |_____|   |
;; '---i-----'   '--X--i---'
RightLeftBotWidth := windowLeftWidth
RightLeftBotHeight := monitorHeight - taskbarHeight - (windowBorder * 3) - windowLeftSmallTopHeight
RightLeftBotLeft := windowBorder
RightLeftBotTop := windowLeftSmallTopHeight + (windowBorder * 2)

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

    noOverrides = 1

    For index, value in tmpArray{
      ;;MsgBox, index:`t%index%`n
      if(WinActive("ahk_exe" . index)){
        MyLeft := MyLeft + windowOverrides[index]["left"]
        MyTop := MyTop + windowOverrides[index]["top"]
        Width := Width + windowOverrides[index]["width"]
        Height := Height + windowOverrides[index]["height"]
        noOverrides = 0
        ;;MsgBox, MyLeft:`t%MyLeft%`n | MyTop:`t%MyTop% | Width:`t%Width% | Height:`t%Height%
      }
    }

    if(noOverrides == 1) {
      MyLeft := MyLeft + windowOverrides["default"]["left"]
      MyTop := MyTop + windowOverrides["default"]["top"]
      Width := Width + windowOverrides["default"]["width"]
      Height := Height + windowOverrides["default"]["height"]
      ;;MsgBox, test2
    }

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%

}

;; configure menu
Menu, Tray, Icon , Television.ico
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

;;  _________     _________
;; |     |   |   |  e  |_r_|
;; |  q  | w |   |_____| f |
;; '-----i---'   '--d--i---'

;; keyboard shortcuts
#q::ResizeWinMine(RightLeftWidth,RightLeftHeight, RightLeftLeft, RightLeftTop)
#w::ResizeWinMine(RightRightWidth,RightRightHeight, RightRightLeft, RightRightTop)
;#r::ResizeWinMine(RightRightTopWidth,RightRightTopHeight, RightRightTopLeft, RightRightTopTop)
;#f::ResizeWinMine(RightRightBotWidth,RightRightBotHeight, RightRightBotLeft, RightRightBotTop)


#e::ResizeWinMine(RightLeftTopWidth,RightLeftTopHeight, RightLeftTopLeft, RightLeftTopTop)
#d::ResizeWinMine(RightLeftBotWidth,RightLeftBotHeight, RightLeftBotLeft, RightLeftBotTop)

#z::ResizeWinMine(LeftLeftWidth,LeftLeftHeight, LeftLeftLeft, LeftLeftTop)
#x::ResizeWinMine(LeftRightWidth,LeftRightHeight, LeftRighteft, LeftRightTop)

#r::ResizeWinMine(vertWindowWidth, vertWindowWTopHeight, 15, 15)
#f::ResizeWinMine(vertWindowWidth, vertWindowWBotHeight, 15, (vertWindowWTopHeight + (windowBorder)))

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
