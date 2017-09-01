#Include <WinAPI.au3>
#Include <WindowsConstants.au3>
#include 'TCP Funcs.au3'

global $ConnectedSocket
global $MainSocket
global $Socket
global $start = false
global $feedback
global $ip = "71.252.161.217"
global $port = 5001
Global $aKeyStillPressed[255] ;used to keep track of keystate
Global $u32dll = DllOpen("user32.dll")
Global $hDC, $hPen, $hWnd ; Needed to Dispose later
$User32 = DllOpen("User32.dll")
$x1 = @DesktopWidth/2+190
$y1 = @DesktopHeight/2+14
$x2 = @DesktopWidth/2+190
$y2 = @DesktopHeight/2+64
$x3 = @DesktopWidth/2+190
$y3 = @DesktopHeight/2+114
$x4 = @DesktopWidth/2+190
$y4 = @DesktopHeight/2+164
$health = 0
Opt("MouseClickDelay",0)
Opt("MouseClickDownDelay",0)
HotKeySet("!v", "enable")
; create GUI
$GUI = GuiCreate("",@DesktopWidth,@DesktopHeight,0, 0,$WS_POPUP, bitor($WS_EX_LAYERED,$WS_EX_TRANSPARENT))
GuiSetBkColor(0x123456)
_WinAPI_SetLayeredWindowAttributes($GUI,0x123456,255,0x01)
WinSetOnTop($GUI, "", 1)
; Target box numbers
GUICtrlCreateLabel( " 1" _
         & @CRLF & @CRLF & @CRLF & @CRLF & " 2 " _
		 & @CRLF & @CRLF & @CRLF & @CRLF & " 3 " _
		 & @CRLF & @CRLF & @CRLF & @CRLF & " 4 ", @DesktopWidth/2+150, @DesktopHeight/2+0, @DesktopWidth/2+230, @DesktopHeight/2+28,0)
GuiSetState()
_DrawRectEx($GUI, @DesktopWidth/2+150, @DesktopHeight/2+150, @DesktopWidth/2+230, @DesktopHeight/2+178, 1, 0xFF)
_DrawRectEx2($GUI, @DesktopWidth/2+150, @DesktopHeight/2+100, @DesktopWidth/2+230, @DesktopHeight/2+128, 1, 0xFF)
_DrawRectEx3($GUI, @DesktopWidth/2+150, @DesktopHeight/2+50, @DesktopWidth/2+230, @DesktopHeight/2+78, 1, 0xFF)
_DrawRectEx4($GUI, @DesktopWidth/2+150, @DesktopHeight/2+0, @DesktopWidth/2+230, @DesktopHeight/2+28, 1, 0xFF)

Func _DrawRectEx($hGUI, $LeftValue, $TopValue, $RightValue, $BottomValue, $RectWidth, $RectColour)
    ; Draws a rectangle around the given area
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
Func _DrawRectEx2($hGUI, $LeftValue, $TopValue, $RightValue, $BottomValue, $RectWidth, $RectColour)
    ; Draws a rectangle around the given area
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
EndFunc   ;==>DrawRectEx2
Func _DrawRectEx3($hGUI, $LeftValue, $TopValue, $RightValue, $BottomValue, $RectWidth, $RectColour)
    ; Draws a rectangle around the given area
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
EndFunc    ;==>DrawRectEx3
Func _DrawRectEx4($hGUI, $LeftValue, $TopValue, $RightValue, $BottomValue, $RectWidth, $RectColour)
    ; Draws a rectangle around the given area
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
EndFunc   ;==>DrawRectEx4

; Script Start

TCPStartup()
	connectServer()
	while 1
		if $start = true then
			If _IsPressedEx('31') Then
				$szData = "target1"
				TCPSendMessage($Socket, $szData)
				$szData=""
				_SetTarget1()
			endif
			If _IsPressedEx('32') Then
				$szData = "target2"
				TCPSendMessage($Socket, $szData)
				$szData=""
				_SetTarget2()
			endif
			If _IsPressedEx('33') Then
				$szData = "target3"
				TCPSendMessage($Socket, $szData)
				$szData=""
				_SetTarget3()
			endif
			If _IsPressedEx('34') Then
				$szData = "target4"
				TCPSendMessage($Socket, $szData)
				$szData=""
				_SetTarget4()
			endif
			If _IsPressedEx('35') Then
				$szData = "syncdrop"
				TCPSendMessage($Socket, $szData)
				$szData=""
				_SyncDrop()
			endif
		endif
	wend

func connectServer()
	$Socket = TCPConnect($ip, $port)
	while $socket = -1
		traytip("","Connecting Again", 5)
		$Socket = TCPConnect($ip, $port)
	wend
	traytip("","Connected", 5)
endfunc

Func _SyncDrop()
	ToolTip($health,0,0)
    Send ("=")
EndFunc
Func _SetTarget1()
	Send ("-")
	Local $posStart = MouseGetPos()
	DllCall("user32.dll","bool","SetCursorPos","int",$x1,"int",$y1)
	MouseClick('primary')
	DllCall("user32.dll", "bool", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
	;DllCall("user32.dll", "none", "mouse_event", "int", 32770, "int", "int", "int", 0, "int", 0) ; 32770 0x8002 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTDOWN)
    ;DllCall("user32.dll", "none", "mouse_event", "int", 32772, "int", "int", "int", 0, "int", 0) ; 32772 0x8004 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTUP)
	;MouseClick("left", @DesktopWidth/2+190, @DesktopHeight/2+164, 1, 0)
EndFunc
Func _SetTarget2()
	Send ("-")
	Local $posStart = MouseGetPos()
	DllCall("user32.dll","bool","SetCursorPos","int",$x2,"int",$y2)
	MouseClick('primary')
	DllCall("user32.dll", "bool", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
	;DllCall("user32.dll", "none", "mouse_event", "int", 32770, "int", "int", "int", 0, "int", 0) ; 32770 0x8002 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTDOWN)
    ;DllCall("user32.dll", "none", "mouse_event", "int", 32772, "int", "int", "int", 0, "int", 0) ; 32772 0x8004 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTUP)
	;MouseClick("left", @DesktopWidth/2+190, @DesktopHeight/2+164, 1, 0)
EndFunc
Func _SetTarget3()
	Send ("-")
	Local $posStart = MouseGetPos()
	DllCall("user32.dll","bool","SetCursorPos","int",$x3,"int",$y3)
	MouseClick('primary')
	DllCall("user32.dll", "bool", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
	;DllCall("user32.dll", "none", "mouse_event", "int", 32770, "int", "int", "int", 0, "int", 0) ; 32770 0x8002 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTDOWN)
    ;DllCall("user32.dll", "none", "mouse_event", "int", 32772, "int", "int", "int", 0, "int", 0) ; 32772 0x8004 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTUP)
	;MouseClick("left", @DesktopWidth/2+190, @DesktopHeight/2+164, 1, 0)
EndFunc
Func _SetTarget4()
	Send ("-")
	Local $posStart = MouseGetPos()
	DllCall("user32.dll","bool","SetCursorPos","int",$x4,"int",$y4)
	MouseClick('primary')
	DllCall("user32.dll", "bool", "SetCursorPos", "int", $posStart[0], "int", $posStart[1])
	;DllCall("user32.dll", "none", "mouse_event", "int", 32770, "int", "int", "int", 0, "int", 0) ; 32770 0x8002 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTDOWN)
    ;DllCall("user32.dll", "none", "mouse_event", "int", 32772, "int", "int", "int", 0, "int", 0) ; 32772 0x8004 BitOR($MOUSEEVENTF_ABSOLUTE, $MOUSEEVENTF_LEFTUP)
	;MouseClick("left", @DesktopWidth/2+190, @DesktopHeight/2+164, 1, 0)
EndFunc

Func _IsPressedEx($hexKey)
    Local $iKey = Dec($hexKey)
    If $iKey > 255 Or $iKey < 0 Then Return SetError(1,0,0)
    Local $aR = DllCall($u32dll, "int", "GetAsyncKeyState", "int",'0x' & $hexKey)
    If @error Then Return SetError(2,0,0)
    If $aKeyStillPressed[$iKey] Then ;If the key was already registered as pressed
        If BitAND($aR[0], 0x8000) <> 0x8000 Then $aKeyStillPressed[$iKey] = False ;Check if it is still pressed and update if needed
        Return 0 ;do nothing
    ElseIf BitAND($aR[0], 0x8000) = 0x8000 Then ;If the key wasn't registered as pressed, but is pressed now it must be a new keypress
        $aKeyStillPressed[$iKey] = True ;Update the pressed status
        Return 1
    EndIf
    Return 0
EndFunc

Func _Exit()
	_WinAPI_DeleteObject($hPen)
    _WinAPI_ReleaseDC($hWnd, $hDC)
    DllClose($u32dll)
    Exit
EndFunc
