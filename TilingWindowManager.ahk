#Persistent

;;configure menu
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

;;window sizing options
windowBorder = 10
windowLeftWidth = 1200
windowRightSmallTopHeight = 550
taskbarHeight = 30

;;monitor geometry
monitorBorderRight = 1920
monitorBorderLeft = 0
monitorWidth = 1920
monitorHeight = 1080

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

;;simplified winmove function call
ResizeWinMine(Width = 0,Height = 0, MyLeft = 0, MyTop = 0)
{
    WinGetPos,X,Y,W,H,A

    If %Width% = 0
      Width := W

    If %Height% = 0
      Height := H

    WinMove,A,,%MyLeft%,%MyTop%,%Width%,%Height%
}

;;keyboard shortcuts
#a::ResizeWinMine(LeftLeftWidth,LeftLeftHeight, LeftLeftLeft, LeftLeftTop)
#s::ResizeWinMine(LeftRightWidth,LeftRightHeight, LeftRightLeft, LeftRightTop)

#q::ResizeWinMine(RightLeftWidth,RightLeftHeight, RightLeftLeft, RightLeftTop)
#w::ResizeWinMine(RightRightWidth,RightRightHeight, RightRightLeft, RightRightTop)
#e::ResizeWinMine(RightRightTopWidth,RightRightTopHeight, RightRightTopLeft, RightRightTopTop)
#d::ResizeWinMine(RightRightBotWidth,RightRightBotHeight, RightRightBotLeft, RightRightBotTop)

;;menu items
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
