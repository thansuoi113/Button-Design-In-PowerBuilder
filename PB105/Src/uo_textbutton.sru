$PBExportHeader$uo_textbutton.sru
forward
global type uo_textbutton from statictext
end type
end forward

global type uo_textbutton from statictext
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
event mousedown pbm_lbuttondown
event mouseup pbm_lbuttonup
event mousemove pbm_mousemove
end type
global uo_textbutton uo_textbutton

type prototypes
Function Long SetCapture(  Long hwnd) Library "user32" 
Function Long ReleaseCapture() Library "user32"
Function ulong CreateRoundRectRgn(ulong X1,ulong Y1,ulong X2,ulong Y2,ulong X3,ulong Y3) LIBRARY "gdi32.dll"
Function ulong SetWindowRgn(ulong hWnd,ulong hRgn,boolean bRedraw) LIBRARY "user32.dll"
end prototypes

type variables
boolean changed=false
end variables

event mousedown;// button display sag
This.BorderStyle = StyleLowered!

end event

event mouseup;//button back to normal
This.Weight = 400
This.TextColor = RGB(0,64,128)
This.BorderStyle = StyleRaised!
changed = False
ReleaseCapture()

end event

event mousemove;Long hand
hand = Handle(This)
If xpos >= 0 And xpos <= This.Width And ypos >= 0 And ypos <= This.Height Then
	If Not changed Then
		//The button text turns red and thicker when the mouse is moved
		//You can also change the background color, there is no change here
		This.Weight = 700
		This.TextColor = RGB(255,0,0)
		changed = True
	End If
	SetCapture(hand)
Else
	//The button text returns to its original state when the mouse moves out of the button
	This.Weight = 400
	This.TextColor = RGB(0,64,128)
	This.BorderStyle = StyleRaised!
	changed = False
	ReleaseCapture()
End If

end event

on uo_textbutton.create
end on

on uo_textbutton.destroy
end on

event constructor;Long l1
Long x1,y1,w1,h1
x1 = UnitsToPixels(This.X,XUnitsToPixels!)
y1 = UnitsToPixels(This.Y,yUnitsToPixels!)
w1 = UnitsToPixels(This.Width,XUnitsToPixels!)
h1 = UnitsToPixels(This.Height,yUnitsToPixels!)
l1 = CreateRoundRectRgn(1,1,w1,h1,4,4)
setwindowRgn(Handle(This),l1,True)

end event

