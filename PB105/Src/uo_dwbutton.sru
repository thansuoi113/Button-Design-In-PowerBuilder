$PBExportHeader$uo_dwbutton.sru
forward
global type uo_dwbutton from datawindow
end type
end forward

global type uo_dwbutton from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event mousemove pbm_mousemove
event mousedown pbm_lbuttondown
event mouseup pbm_lbuttonup
end type
global uo_dwbutton uo_dwbutton

type prototypes
Function Long SetCapture(  Long hwnd) Library "user32"
Function Long ReleaseCapture() Library "user32"
Function ULong CreateRoundRectRgn(ULong X1,ULong Y1,ULong X2,ULong Y2,ULong X3,ULong Y3) Library "gdi32.dll"
Function ULong SetWindowRgn(ULong hwnd,ULong hRgn,Boolean bRedraw) Library "user32.dll"

end prototypes

type variables
Boolean changed = False
Long w1,h1 //The width and height of the button, in pixels
String is_ButtonText = "None" //Button name
Long il_TextSize = -10
String is_TextFont = "Arial"
Long il_TextColor = 16777215
Long il_HoverTextColor = 16711680

Int ii_BlueS = 255
Int ii_GreenS = 255
Int ii_RedS = 255

Int ii_BlueE = 0
Int ii_GreenE = 0
Int ii_RedE = 0

end variables

forward prototypes
public subroutine of_setbuttontext (string as_text)
public subroutine of_settextsize (long al_textsize)
public subroutine of_settextfont (string as_textfont)
public subroutine of_settextcolor (long al_textcolor)
public subroutine of_sethovertextcolor (long al_hovertextcolor)
public subroutine of_setbackgroundendcolor (long al_color)
public subroutine of_setbackgroundstartcolor (long al_color)
end prototypes

event mousemove;Long hand
hand = Handle(This)
//Forms a gradient of white and black below
If xpos >= 0 And xpos <= This.Width And ypos >= 0 And ypos <= This.Height Then
	If Not changed Then
		Integer i_for
		Long j_1
		String s_name,s_create
		For i_for = 0 To h1
			s_name = "line_"+String(i_for)
			j_1 = RGB((h1 - (i_for + ii_RedE))*ii_RedS/h1,(h1 - (i_for + ii_GreenE))*ii_GreenS/h1,(h1 - (i_for + ii_BlueE))*ii_BlueS/h1)
			s_create = s_name+".pen.color='"+String(j_1)+"'"
			This.Modify(s_create)
		Next
		This.Modify("psp.color='"+String(il_HoverTextColor)+"'")
	End If
	changed = True
	SetCapture(hand)
Else
	This.TriggerEvent("mouseup")
	changed = False
	ReleaseCapture()
End If



end event

event mouseup;Integer i_for
Long j_1
String s_name,s_create
//Forms a gradient of black and white
For i_for = 0 To h1
	s_name = "line_"+String(i_for)
	j_1 = RGB((i_for + ii_RedE) *ii_RedS/h1,(i_for + ii_GreenE) *ii_GreenS/h1,(i_for + ii_BlueE) *ii_BlueS/h1)
	s_create = s_name+".pen.color='"+String(j_1)+"'"
	This.Modify(s_create)
Next
This.Modify("psp.color='"+String(il_TextColor)+"'")
changed = False

end event

public subroutine of_setbuttontext (string as_text);is_ButtonText = as_Text
This.Event Constructor( )

end subroutine

public subroutine of_settextsize (long al_textsize);il_TextSize = al_TextSize
This.Event Constructor( )
end subroutine

public subroutine of_settextfont (string as_textfont);is_TextFont = as_TextFont
This.Event Constructor( )
end subroutine

public subroutine of_settextcolor (long al_textcolor);il_TextColor = al_TextColor
This.Event Constructor( )
end subroutine

public subroutine of_sethovertextcolor (long al_hovertextcolor);il_HoverTextColor = al_HoverTextColor
This.Event Constructor( )
end subroutine

public subroutine of_setbackgroundendcolor (long al_color);Long ll_rgb
ll_rgb = al_color

ii_BlueE = Int(ll_rgb/65536.0)
ll_rgb -= ii_BlueE*Long(65536)
ii_GreenE = Int(ll_rgb/256.0)
ii_RedE = ll_rgb - ii_GreenE*256

This.Event Constructor( )


end subroutine

public subroutine of_setbackgroundstartcolor (long al_color);Long ll_rgb
ll_rgb = al_color

ii_BlueS = Int(ll_rgb/65536.0)
ll_rgb -= ii_BlueS*Long(65536)
ii_GreenS = Int(ll_rgb/256.0)
ii_RedS = ll_rgb - ii_GreenS*256

This.Event Constructor( )


end subroutine

on uo_dwbutton.create
end on

on uo_dwbutton.destroy
end on

event constructor;// button shape
String ls_err
Integer i_for
Long j_1
String ls_name,ls_create

//w1 = UnitsToPixels(This.Width,XUnitsToPixels!)
//h1 = UnitsToPixels(This.Height,yUnitsToPixels!)
w1 = This.Width - 1
h1 = This.Height - 1

This.Create('release 10.5; datawindow() table(column=(type=number name=dummy dbname="dummy" ))', ls_err)
If Len(ls_err) > 0 Then
	MessageBox("DW Create Error", ls_err)
End If

//Forms a gradient of black and white
For i_for = 0 To h1
	ls_name = "line_"+String(i_for)
	//j_1 = RGB(i_for*255/h1,i_for*255/h1,i_for*255/h1)
	j_1 = RGB((i_for + ii_RedE) *ii_RedS/h1,(i_for + ii_GreenE )*ii_GreenS/h1,(i_for + ii_BlueE)*ii_BlueS/h1)
	ls_create = "create line(band=background x1='0'"
	ls_create = ls_create+" y1='"+String(i_for)+"' x2='"+String(w1)+"'"
	ls_create = ls_create+" y2='"+String(i_for)+"' name=line_"+String(i_for)+ " pen.color='"+String(j_1)+"' pen.width='1') "
	This.Modify(ls_create)
Next
ls_create = "create text(band=background alignment='0' text=' "+is_ButtonText+"' border='0' color='"+String(il_TextColor)+"' name=psp x='0' y='0' height='"+String(h1)+"' width='"+String(w1)+"'  font.face='"+is_TextFont+"' font.height='"+String(il_TextSize)+"' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127')"
This.Modify(ls_create)

end event

