#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>
#Include <WinAPI.au3>
#Include <WindowsConstants.au3>
#include<misc.au3>

HotKeySet("{ESC}", "_Exit")
HotKeySet("{PAUSE}", "TogglePause")
global $Paused = 1
global $somerandomnumber = 0
global $a = 1
Global $coord
global $b = Random(1200, 1800)

MsgBox($MB_SYSTEMMODAL, "Top Left book", "Hover over the top left corner of your spellbook and press 0 on your keyboard")
Do
    Sleep(1)
 Until _IsPressed("30")
$spellbooktopleft = MouseGetPos()
;MsgBox($MB_SYSTEMMODAL, "Top Left book", "Current mouse position recorded for top left corner of spellbook")
sleep(1500)
MsgBox($MB_SYSTEMMODAL, "Bot Right book", "Hover over the bottom right corner of your spellbook and press 1 on your keyboard")
Do
    Sleep(1)
 Until _IsPressed("31")
$spellbookbotright = MouseGetPos()
;MsgBox($MB_SYSTEMMODAL, "Bot Right book", "Current mouse position recorded for bottom right corner of spellbook")
sleep(1500)
MsgBox($MB_SYSTEMMODAL, "Top left alchemy", "Hover over the top left corner of your alchemy spell and press 2 on your keyboard")
Do
    Sleep(1)
 Until _IsPressed("32")
$alchspelltopleft = MouseGetPos()
;MsgBox($MB_SYSTEMMODAL, "Top left alchemy", "Current mouse position recorded for top left corner of alchemy spell")
sleep(1500)
MsgBox($MB_SYSTEMMODAL, "Bot right alchemy", "Hover over the bottom right corner of your alchemy spell and press 3 on your keyboard")
Do
    Sleep(1)
 Until _IsPressed("33")
$alchspellbotright = MouseGetPos()
;MsgBox($MB_SYSTEMMODAL, "Bot right alchemy", "Current mouse position recorded for bottom right corner of alchemy spell")


While 1
   $somerandomnumber = Random(20,155)
   $x = Random($alchspelltopleft[0], $alchspellbotright[0])
   $y = Random($alchspelltopleft[1], $alchspellbotright[1])
   MouseClick("left", $x, $y, 1)
   For $i = 1 To $somerandomnumber Step 1
	  $rand = Random(1.4,1.9)
	  If $a = $b Then
		 $a = 1
		 $b = Random(1200, 1800)
		 ToolTip('Breaking for ' & Floor ($rand*50) & ' seconds.',0,0)
		 sleep($rand*50000)
	  EndIf
	  sleep($rand*1000)
	  MouseClick("left", $x, $y, 1)
	  ToolTip('Clicking ' & $i & ' out of ' & Floor ($somerandomnumber) & ' times.' & ' Breaking in ' & 1500-$a & ' clicks.',0,0)
	  $a = $a + 1
	  $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0xFFFF00)
	  If Not @error Then
		 $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0xFFFFFF)
		 If Not @error Then
			$coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x0B0B0B)
			If Not @error Then
			   $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x95A99E)
			   If Not @error Then
				  $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x3C3C03)
				  If Not @error Then
					 $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x0F100D)
					 If Not @error Then
						SoundPlay(@WindowsDir & "\media\tada.wav", 1)
						$rand = Random(1.1,1.9)
						ToolTip('Breaking for ' & Floor ($rand*5) & ' seconds.',0,0)
						sleep($rand*5000)
						Send("itscole5{ENTER}")
						ToolTip('Breaking for ' & Floor ($rand*5) & ' seconds.',0,0)
						sleep($rand*5000)
						$coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x000000)
						If Not @error Then
						   $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0xFFFFFF)
						   If Not @error Then
							  $coord = PixelSearch( 0, 0, @DesktopWidth, @DesktopHeight, 0x6B1C09)
							  If Not @error Then
								 $rand = Random(1.1,1.9)
								 sleep($rand*1000)
								 MouseClick("primary", $coord[0], $coord[1], 1, 0)
								 ToolTip('Breaking for ' & Floor ($rand*5) & ' seconds.',0,0)
								 sleep($rand*5000)
								 MouseClick("left", Random($spellbooktopleft[0], $spellbookbotright[0], 1), Random($spellbooktopleft[1], $spellbookbotright[1], 1), 1)
								 sleep($rand*1000)
							  EndIf
						   EndIf
						EndIf
					 EndIf
				  EndIf
			   EndIf
			EndIf
		 EndIf
	  EndIf
   Next
   $i = 1
Wend


Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is paused',0,0)
    WEnd
    ToolTip("")
EndFunc
Func _Exit()
   Exit
EndFunc