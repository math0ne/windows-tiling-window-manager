    ##############################################################################
    # Copyright 2015 Aidan McQuay
    #
    # This work is licenced under the Creative Commons BSD License License. To
    # view a copy of this licence, visit http://creativecommons.org/licenses/BSD/
    # or send a letter to Creative Commons, 171 Second Street, Suite 300,
    # San Francisco, California 94105, USA.
    ##############################################################################

![screenshots](http://orig14.deviantart.net/a070/f/2015/051/8/9/windows_8_2015___custom_tiling_window_manager_by_math0ne-d8isqcr.png)


A very simple tiling window manager for Windows 7 and 8.  This is
prob not ready to use out of the box but if you have some basic
Autohotkey knowledge you should be able to get it working. By default the window arrangment looks like this:

    ;;  _________     _________
    ;; |   |     |   |     |___| <- primary monitor
    ;; |   |     |   |     |   |
    ;; '---i-----'   '-----i---'

The main functions are in hotkeys and to get it working for your
specfic resolution / taskbar size you may have to adjust some of the
numbers in the assigned functions.  There is a tray icon as well so its usable without keyboard shoprtcuts
for windows 8 touch.  The keys are: win + qwedas

    ;;  _________     _________   |   _________
    ;; |   |     |   |     |   |  |  |     |_e_| <- primary monitor
    ;; | a |  s  |   |  q  | w |  |  |  q  | d |
    ;; '---i-----'   '-----i---'  |  '-----i---'

I have added support for program based offsets, in windows 10 there is no way to 100% accuratly size a window.  There is a way to measure windows though so you can find the offset.  This prob could be automated in the future using WinGetPosEx, for now you can configure the default offset using:

    windowOverrides["default"]                   := Object()
    windowOverrides["default"]["left"]           := -8
    windowOverrides["default"]["top"]            := 0
    windowOverrides["default"]["width"]          := +16
    windowOverrides["default"]["height"]         := +8

And program specifics offsets using:

    windowOverrides["putty.exe"]                   := Object()
    windowOverrides["putty.exe"]["left"]           := -4
    windowOverrides["putty.exe"]["top"]            := 0
    windowOverrides["putty.exe"]["width"]          := +8
    windowOverrides["putty.exe"]["height"]         := +4
