if global.blue_score>=21 and !global.done{
	_id=instance_create_depth(0,0,-1,obj_title)
	_id._color=c_blue
		_id._text=@"BLUE WINS
		PRESS R TO RESTART"
	global.done=1
}
if global.red_score>=21 and !global.done{
		_id=instance_create_depth(0,0,-1,obj_title)
		_id._color=c_red
		_id._text=@"RED WINS
		PRESS R TO RESTART"
			global.done=1
		}
if global.done{
if keyboard_check(ord("R")){global.done=0
global.red_score=0
global.blue_score=0
_on_hand=1
_on_hand_who="red"
	}	
}
image_xscale=2+_z/7
image_yscale=2+_z/7
draw_self()
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_set_alpha(1)
draw_set_color(c_blue)
draw_text_transformed(224,52,
string(global.blue_score),3,3,0)
draw_set_color(c_red)
draw_text_transformed(296,52,
string(global.red_score),3,3,0)

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_color(c_black)
draw_text(482,10,@"W A S D : Move.
Mouse Left Click : 
Hit/Serve.")
///draw_text(100,100,string(_z)+" , "+string(_z_speed))