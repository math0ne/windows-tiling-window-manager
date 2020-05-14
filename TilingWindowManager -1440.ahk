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



;; override system, here you can define a default offset and specific program offsets
;; this will allow you to setup for custom themes and programs that wont behave
;; I tried to make this work with WinGetPosEx but even that had many faults
global windowOverrides                            := Object()

windowOverrides["default"]                   := Object()
windowOverrides["default"]["left"]           := -8
windowOverrides["default"]["top"]            := 0
windowOverrides["default"]["width"]          := +16
windowOverrides["default"]["height"]         := +8

windowOverrides["ONENOTE.EXE"]                   := Object()
windowOverrides["ONENOTE.EXE"]["left"]           := 0
windowOverrides["ONENOTE.EXE"]["top"]            := 0
windowOverrides["ONENOTE.EXE"]["width"]          := 0
windowOverrides["ONENOTE.EXE"]["height"]         := 0

windowOverrides["Steam.exe"]                   := Object()
windowOverrides["Steam.exe"]["left"]           := 1
windowOverrides["Steam.exe"]["top"]            := 1
windowOverrides["Steam.exe"]["width"]          := -2
windowOverrides["Steam.exe"]["height"]         := -2

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

windowOverrides["ApplicationFrameHost.exe"]                   := Object()
windowOverrides["ApplicationFrameHost.exe"]["left"]           := -8
windowOverrides["ApplicationFrameHost.exe"]["top"]            := 0
windowOverrides["ApplicationFrameHost.exe"]["width"]          := +16
windowOverrides["ApplicationFrameHost.exe"]["height"]         := +8

windowOverrides["Code.exe"]                   := Object()
windowOverrides["Code.exe"]["left"]           := 0
windowOverrides["Code.exe"]["top"]            := 0
windowOverrides["Code.exe"]["width"]          := 0
windowOverrides["Code.exe"]["height"]         := 0

windowOverrides["Code - Insiders.exe"]                   := Object()
windowOverrides["Code - Insiders.exe"]["left"]           := 0
windowOverrides["Code - Insiders.exe"]["top"]            := 0
windowOverrides["Code - Insiders.exe"]["width"]          := 0
windowOverrides["Code - Insiders.exe"]["height"]         := 0

windowOverrides["slack.exe"]                   := Object()
windowOverrides["slack.exe"]["left"]           := 0
windowOverrides["slack.exe"]["top"]            := 0
windowOverrides["slack.exe"]["width"]          := 0
windowOverrides["slack.exe"]["height"]         := 0

windowOverrides["Spotify.exe"]                   := Object()
windowOverrides["Spotify.exe"]["left"]           := 0
windowOverrides["Spotify.exe"]["top"]            := 0
windowOverrides["Spotify.exe"]["width"]          := 0
windowOverrides["Spotify.exe"]["height"]         := 0

windowOverrides["Photoshop.exe"]                   := Object()
windowOverrides["Photoshop.exe"]["left"]           := 0
windowOverrides["Photoshop.exe"]["top"]            := 0
windowOverrides["Photoshop.exe"]["width"]          := 0
windowOverrides["Photoshop.exe"]["height"]         := 0

windowOverrides["EXCEL.EXE"]                   := Object()
windowOverrides["EXCEL.EXE"]["left"]           := 0
windowOverrides["EXCEL.EXE"]["top"]            := 0
windowOverrides["EXCEL.EXE"]["width"]          := 0
windowOverrides["EXCEL.EXE"]["height"]         := 0

windowOverrides["Discord.exe"]                   := Object()
windowOverrides["Discord.exe"]["left"]           := 0
windowOverrides["Discord.exe"]["top"]            := 0
windowOverrides["Discord.exe"]["width"]          := 0
windowOverrides["Discord.exe"]["height"]         := 0

windowOverrides["Ripcord.exe"]                   := Object()
windowOverrides["Ripcord.exe"]["left"]           := 0
windowOverrides["Ripcord.exe"]["top"]            := 0
windowOverrides["Ripcord.exe"]["width"]          := 0
windowOverrides["Ripcord.exe"]["height"]         := 0

windowOverrides["Battle.net.exe"]                   := Object()
windowOverrides["Battle.net.exe"]["left"]           := 0
windowOverrides["Battle.net.exe"]["top"]            := 0
windowOverrides["Battle.net.exe"]["width"]          := 0
windowOverrides["Battle.net.exe"]["height"]         := 0

windowOverrides["Messenger.exe"]                   := Object()
windowOverrides["Messenger.exe"]["left"]           := 0
windowOverrides["Messenger.exe"]["top"]            := 0
windowOverrides["Messenger.exe"]["width"]          := 0
windowOverrides["Messenger.exe"]["height"]         := 0

windowOverrides["Tweeten.exe"]                   := Object()
windowOverrides["Tweeten.exe"]["left"]           := 0
windowOverrides["Tweeten.exe"]["top"]            := 0
windowOverrides["Tweeten.exe"]["width"]          := 0
windowOverrides["Tweeten.exe"]["height"]         := 0

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

;; size of space between windows
windowBorder = 10
;; width of the large windows that appear closest to the center of the screen
windowLeftWidth = 1260
;; height of the small top right window
windowRightSmallTopHeight = 700

topWindowTriWidth = 843

;; monitor geometry
;; todo: automate this
monitorWidth = 2560
monitorHeight = 1440
taskbarHeight = 30

;;calculated variables used below
windowHeightTall := monitorHeight - (windowBorder * 2)
windowHeightTallTaskbar := monitorHeight - (windowBorder * 2) - taskbarHeight
windowRightWidth := monitorWidth - windowLeftWidth - (windowBorder * 3)

newZero := 0

;;  _________
;; |    |    |  -- BotLeft
;; |    |    |
;; '----i----'
;;  _________
;; | xx |    |  
;; | xx |    |
;; '----i----'
botLeftWidth :=  windowLeftWidth
botLeftHeight := windowHeightTallTaskbar
botLeftLeft := windowBorder
botLeftTop := windowBorder

;;  _________
;; |    |    |  -- BotRight
;; |    |    |
;; '----i----'
;;  _________
;; |    | xx |  
;; |    | xx |
;; '----i----'
botRightWidth :=  monitorWidth - windowLeftWidth - (windowBorder * 3)
botRightHeight := windowHeightTallTaskbar
botRightLeft := windowLeftWidth + (windowBorder * 2)
botRightTop := windowBorder

;;  _________
;; |    |    |  -- BotRightTop
;; |    |    |
;; '----i----'
;;  _________
;; |    |_xx_|  
;; |    |    |
;; '----i----'
BotRightTopWidth :=  monitorWidth - windowLeftWidth - (windowBorder * 3)
BotRightTopHeight := windowRightSmallTopHeight
BotRightTopLeft := windowLeftWidth + (windowBorder * 2)
BotRightTopTop := windowBorder

;;  _________
;; |    |    |  -- BotRightBottom
;; |    |    |
;; '----i----'
;;  _________
;; |    |____|  
;; |    | xx |
;; '----i----'
BotRightBottomtWidth :=  monitorWidth - windowLeftWidth - (windowBorder * 3)
BotRightBottomHeight := monitorHeight - windowRightSmallTopHeight - (windowBorder * 3) - taskbarHeight
BotRightBottomLeft := windowLeftWidth + (windowBorder * 2)
BotRightBottomTop := windowRightSmallTopHeight + (windowBorder * 2)

;;  _________
;; | xx |    |  -- TopLeft
;; | xx |    |
;; '----i----'
;;  _________
;; |    |    |  
;; |    |    |
;; '----i----'
TopLeftWidth :=  windowLeftWidth
TopLeftHeight := windowHeightTall
TopLeftLeft := windowBorder
TopLeftTop := windowBorder - monitorHeight

;;  _________
;; |    | xx |  -- TopRight
;; |    | xx |
;; '----i----'
;;  _________
;; |    |    |  
;; |    |    |
;; '----i----'
TopRightWidth :=  monitorWidth - windowLeftWidth - (windowBorder * 3)
TopRightHeight := windowHeightTall
TopRightLeft := windowLeftWidth + (windowBorder * 2)
TopRightTop := windowBorder - monitorHeight

;;  _________
;; | x|   |  |  -- TriTopLeft
;; |  |   |  |
;; '---------'
;;  _________
;; |    |    |  
;; |    |    |
;; '----i----'
TriTopLeftWidth := topWindowTriWidth
TriTopLeftHeight := windowHeightTall
TriTopLeftLeft := windowBorder
TriTopLeftTop := windowBorder - monitorHeight

;;  _________
;; |  | x |  |  -- TriTopMiddle
;; |  |   |  |
;; '---------'
;;  _________
;; |    |    |  
;; |    |    |
;; '----i----'
TriTopMiddleWidth := topWindowTriWidth - windowBorder
TriTopMiddleHeight := windowHeightTall
TriTopMiddleLeft := (windowBorder * 2) + topWindowTriWidth
TriTopMiddleTop := windowBorder - monitorHeight

;;  _________
;; |  |   | x|  -- TriTopRight
;; |  |   |  |
;; '---------'
;;  _________
;; |    |    |  
;; |    |    |
;; '----i----'
TriTopRightWidth := topWindowTriWidth
TriTopRightHeight := windowHeightTall
TriTopRightLeft := (windowBorder * 2) + (topWindowTriWidth * 2)
TriTopRightTop := windowBorder - monitorHeight

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

#1::ResizeWinMine(TriTopLeftWidth, TriTopLeftHeight, TriTopLeftLeft, TriTopLeftTop)
#2::ResizeWinMine(TriTopMiddleWidth, TriTopMiddleHeight, TriTopMiddleLeft, TriTopMiddleTop)
#3::ResizeWinMine(TriTopRightWidth, TriTopRightHeight, TriTopRightLeft, TriTopRightTop)

#q::ResizeWinMine(TopLeftWidth, TopLeftHeight, TopLeftLeft, TopLeftTop)
#w::ResizeWinMine(TopRightWidth, TopRightHeight, TopRightLeft, TopRightTop)

#a::ResizeWinMine(botLeftWidth, botLeftHeight, botLeftLeft, botLeftTop)
#s::ResizeWinMine(botRightWidth, botRightHeight, botRightLeft, botRightTop)

#e::ResizeWinMine(BotRightTopWidth, BotRightTopHeight, BotRightTopLeft, BotRightTopTop)
#d::ResizeWinMine(BotRightBottomtWidth, BotRightBottomHeight, BotRightBottomLeft, BotRightBottomTop)

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
