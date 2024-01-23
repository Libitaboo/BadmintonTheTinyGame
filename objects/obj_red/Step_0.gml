if 	global.done=1{exit}
_to_mouse_direction=point_direction(x,y,mouse_x,mouse_y)

_x_move=keyboard_check(ord("A"))-keyboard_check(ord("D"))
_y_move=keyboard_check(ord("S"))-keyboard_check(ord("W"))

_move=abs(_x_move)+abs(_y_move)

x+=-_x_move*5*real($"{(abs(_x_move)+abs(_y_move)=2) ? 1/sqrt(2) : 1}")
y+=_y_move*5*real($"{(abs(_x_move)+abs(_y_move)=2) ? 1/sqrt(2) : 1}")

image_angle=_to_mouse_direction-90
if obj_shuttlecock._on_hand and obj_shuttlecock._on_hand_who="red"{_serve_colddown++}
if _colddown=0 and mouse_check_button(mb_left) and _can_hit{
	if obj_shuttlecock._on_hand and obj_shuttlecock._on_hand_who="red"and _serve_colddown>=60{
		image_speed=2
		_hitting=1
		_colddown=10
		_can_hit=0
		_serve_colddown=0
	}
	if !obj_shuttlecock._on_hand {
		image_speed=2
		_hitting=1
		_colddown=10
		_can_hit=0
	}
}
if mouse_check_button_released(mb_left){_can_hit=1}
if image_index=3{
	image_speed=0
	if _wait=5{
		image_index=0
		_wait=0
		_hitting=0
	}else{
		_wait++	
	}
}
if _colddown>0{_colddown--}
if y<374{y=374}
if y>644{y=644}
if x<70{x=70}
if x>472{x=472}