if 	global.done=1{exit}
if _on_hand{
	_z=1
	_z_speed=0
	if _on_hand_who="red"{
		image_angle=obj_red._to_mouse_direction+90
		x=obj_red.x+cos(degtorad(obj_red._to_mouse_direction))*25*2
		y=obj_red.y-sin(degtorad(obj_red._to_mouse_direction))*25*2
		if obj_red._hitting{
			_on_hand=0
			_direction=obj_red._to_mouse_direction
			image_angle=_direction+90
			audio_play_sound(snd_slap,random_range(0.6,1.4),0)
		}
	}
	if _on_hand_who="blue"{
		image_angle=obj_blue._face_direction+90
		x=obj_blue.x+cos(degtorad(obj_blue._face_direction))*25*2
		y=obj_blue.y-sin(degtorad(obj_blue._face_direction))*25*2
		if obj_blue._hitting{
			_on_hand=0
			_direction=obj_blue._face_direction
			image_angle=_direction+90
			audio_play_sound(snd_slap,random_range(0.6,1.4),0)
		}
	}
	exit
}
move_towards_point(x+cos(degtorad(_direction))*_speed,y-sin(degtorad(_direction))*_speed,_speed)
image_angle=_direction+90
if _z<0{_z=0}
if _z=0 and !_on_hand{
	if y<376{
		if global.owner="red"{
			_id=instance_create_depth(0,0,-1,obj_title)
			global.red_score++
			global.owner="blue"
			_on_hand=1
			_on_hand_who="blue"
			_id._text="RED GOAL"
			_id._color=c_red
		}else{
			_id=instance_create_depth(0,0,-1,obj_title)
			global.red_score++
			global.owner="red"
			_on_hand=1
			_on_hand_who="red"
			_id._text="BLUE FALL"
			_id._color=c_blue
		}
	}else{
		if global.owner="blue"{
			_id=instance_create_depth(0,0,-1,obj_title)
			_id._text="BLUE GOAL"
			_id._color=c_blue
			_on_hand_who="red"
			_on_hand=1
			global.blue_score++
			global.owner="red"
		}else{
			_id=instance_create_depth(0,0,-1,obj_title)
			_id._text="RED FALL"
			_id._color=c_red
			_on_hand_who="blue"
			_on_hand=1
			global.blue_score++
			global.owner="blue"
		}
	}
}
//if _z=0{
	if  y<106 or x<70 or x>472 or y>648{
		_id=instance_create_depth(0,0,-1,obj_title)
		if global.owner="red" {
				_id._text="RED OUT"
				_id._color=c_red
				_on_hand_who="blue"
				_on_hand=1
				global.blue_score++
				global.owner="blue"
			
		}else{
				_id._text="BLUE OUT"
				_id._color=c_blue
				_on_hand_who="red"
				_on_hand=1
				global.red_score++
				global.owner="red"
			
		}
	}
//}

	_z-=_z_speed	
	_z_speed+=0.1



