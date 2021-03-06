$PBExportHeader$uo_picbutton.sru
forward
global type uo_picbutton from picture
end type
end forward

global type uo_picbutton from picture
integer width = 329
integer height = 176
boolean originalsize = true
boolean focusrectangle = false
event mousedown pbm_lbuttondown
event mousemove pbm_mousemove
event mouseup pbm_lbuttonup
end type
global uo_picbutton uo_picbutton

type prototypes
Function Long SetCapture(  Long hwnd) Library "user32" 
Function Long ReleaseCapture() Library "user32"
Function ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"
Function ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"
end prototypes

type variables
Boolean changed = False
String s_normal //image path and file name in normal state
String s_over //The image path and file name under the mouse over
String s_down //The image path and file name under the mouse button
String s_disable //The image path and file name in the disabled state
String s_info //The prompt information of the mouse over

end variables
event mousedown;This.PictureName = s_down

end event

event mousemove;Long hand
hand = Handle(This)
If xpos >= 0 And xpos <= This.Width And ypos >= 0 And ypos <= This.Height Then
	If Not changed Then
		This.PictureName = s_over
		changed = True
	End If
	SetCapture(hand)
Else
	This.PictureName = s_normal
	changed = False
	ReleaseCapture()
End If


end event

event mouseup;This.PictureName = s_normal
changed = False

end event

on uo_picbutton.create
end on

on uo_picbutton.destroy
end on

event constructor;//This button is a rounded button
//The script here is the same as above, omitted here to save space
This.Border = False
This.PictureName = s_normal

end event

