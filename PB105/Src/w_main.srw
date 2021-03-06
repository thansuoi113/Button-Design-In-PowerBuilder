$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type p_min from uo_picbutton within w_main
end type
type p_max from uo_picbutton within w_main
end type
type dw_1 from uo_dwbutton within w_main
end type
type p_uclose from uo_picbutton within w_main
end type
type st_1 from uo_textbutton within w_main
end type
end forward

global type w_main from window
integer width = 2354
integer height = 888
boolean titlebar = true
string title = "Button Design"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_min p_min
p_max p_max
dw_1 dw_1
p_uclose p_uclose
st_1 st_1
end type
global w_main w_main

on w_main.create
this.p_min=create p_min
this.p_max=create p_max
this.dw_1=create dw_1
this.p_uclose=create p_uclose
this.st_1=create st_1
this.Control[]={this.p_min,&
this.p_max,&
this.dw_1,&
this.p_uclose,&
this.st_1}
end on

on w_main.destroy
destroy(this.p_min)
destroy(this.p_max)
destroy(this.dw_1)
destroy(this.p_uclose)
destroy(this.st_1)
end on

event open;p_uclose.s_normal = "Exit1.bmp"
p_uclose.s_over = "Exit5.bmp"
p_uclose.s_down = "Exit3.bmp"
p_uclose.s_disable = "Exit4.bmp"
p_uclose.TriggerEvent(Constructor!)

p_max.s_normal = "Max1.bmp"
p_max.s_over = "Max5.bmp"
p_max.s_down = "Max3.bmp"
p_max.s_disable = "Max4.bmp"
p_max.TriggerEvent(Constructor!)


p_min.s_normal = "Min1.bmp"
p_min.s_over = "Min5.bmp"
p_min.s_down = "Min3.bmp"
p_min.s_disable = "Min4.bmp"
p_min.TriggerEvent(Constructor!)

dw_1.of_setbuttontext("https://programmingmethodsit.com/")
dw_1.of_settextsize( -20)
dw_1.of_setbackgroundstartcolor(255)

end event

type p_min from uo_picbutton within w_main
integer x = 1207
integer y = 32
integer width = 293
integer height = 224
boolean originalsize = false
end type

type p_max from uo_picbutton within w_main
integer x = 1573
integer y = 32
integer width = 293
integer height = 224
boolean originalsize = false
end type

type dw_1 from uo_dwbutton within w_main
integer x = 37
integer y = 480
integer width = 2231
integer height = 256
integer taborder = 10
long w1 = 951
long h1 = 300
end type

type p_uclose from uo_picbutton within w_main
integer x = 1938
integer y = 32
integer width = 293
integer height = 224
boolean originalsize = false
end type

type st_1 from uo_textbutton within w_main
integer x = 73
integer y = 320
integer width = 1801
integer height = 128
integer textsize = -16
string text = "https://programmingmethodsit.com/"
end type

