	if obj_red._hitting and !_on_hand and _z<=2{
		_z=1
		_z_speed=-min(point_distance(obj_red.x,obj_red.y,mouse_x,mouse_y)/50,2)
		_speed=(point_distance(obj_red.x,obj_red.y,mouse_x,mouse_y)/40)
		global.owner="red"
		audio_play_sound(snd_slap,random_range(0.6,1.4),0)
		_direction=obj_red._to_mouse_direction
	}