#Include <WinAPI.au3>
#Include <WindowsConstants.au3>
Global $hDC, $hPen, $hWnd ; Needded to Dispose later
Global $coord
HotKeySet("{ESC}", "_Exit")
HotKeySet("{PAUSE}", "TogglePause")
$GUI = GuiCreate("",@DesktopWidth,@DesktopHeight,0, 0,$WS_POPUP, bitor($WS_EX_LAYERED,$WS_EX_TRANSPARENT))
GuiSetBkColor(0x123456)
_WinAPI_SetLayeredWindowAttributes($GUI,0x123456,255,0x01)
WinSetOnTop($GUI, "", 1)

GuiSetState()
_DrawRectEx($GUI, 50, 50, 125, 125, 1, 0xFF)
_DrawRectEx($GUI, 150, 50, 225, 125, 1, 0xFF)
_DrawRectEx($GUI, 250, 50, 325, 125, 1, 0xFF)
While 1
   $coord = PixelSearch(50, 50, 125, 125, 0xFFFF29)
If Not @error Then
      $coord = PixelSearch(50, 50, 125, 125, 0x100808)
	  If Not @error Then
    MouseClick("primary", $coord[0], $coord[1], 1, 0)
	send("{numpad5}")
	SoundPlay(@WindowsDir & "\media\tada.wav", 1)
	sleep(5000)
	Endif
 EndIf

    $coord = PixelSearch(150, 50, 225, 125, 0xFFFF29)
If Not @error Then
    $coord = PixelSearch(150, 50, 225, 125, 0x100808)
	  If Not @error Then
    MouseClick("primary", $coord[0], $coord[1], 1, 0)
	send("{numpad5}")
	SoundPlay(@WindowsDir & "\media\tada.wav", 1)
		sleep(5000)
	 EndIf
	 Endif

   $coord = PixelSearch(250, 50, 325, 125, 0xFFFF29)
If Not @error Then
    $coord = PixelSearch(250, 50, 325, 125, 0x100808)
	  If Not @error Then
    MouseClick("primary", $coord[0], $coord[1], 1, 0)
	send("{numpad5}")
	SoundPlay(@WindowsDir & "\media\tada.wav", 1)
		sleep(5000)
 EndIf
EndIf

    Sleep(10)
Wend
Func _DrawRectEx($hGUI, $LeftValue, $TopValue, $RightValue, $BottomValue, $RectWidth, $RectColour)
    ; Draws a rectangle around the given area, crossed out.
    Local $obj_orig
    $hWnd = $hGUI
    $hDC = _WinAPI_GetWindowDC($hWnd)
    $hPen = _WinAPI_CreatePen($PS_SOLID, $RectWidth, $RectColour)
    $obj_orig = _WinAPI_SelectObject($hDC, $hPen)
    _WinAPI_MoveTo($hDC, $LeftValue, $TopValue)  ; move pen to the top-left
    _WinAPI_LineTo($hDC, $LeftValue, $BottomValue) ; draw line to the bottom left
    _WinAPI_LineTo($hDC, $RightValue, $BottomValue) ; draw line to the bottom right
    _WinAPI_LineTo($hDC, $RightValue, $TopValue) ; draw line to the top right
    _WinAPI_LineTo($hDC, $LeftValue, $TopValue) ; draw line to the top left
    Return $hDC
 EndFunc   ;==>DrawRectEx

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused = SCRIPT IS NOT RUNNING = you wont get another message if you dont unpause it"',0,0)
    WEnd
    ToolTip("")
EndFunc
Func _Exit()
; You Forgot to releace resources... read the help file about it in the remarks
; section of _winapi_penCreate and _WinApi_GetWindowDC
_WinAPI_DeleteObject($hPen)
_WinAPI_ReleaseDC($hWnd, $hDC)
Exit
EndFunc