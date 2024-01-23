if obj_blue._hitting and !_on_hand and _z<=2{
	_speed=point_distance(obj_blue.x,obj_blue.y,obj_red.x,obj_red.y)/40
	_z=1
	global.owner="blue"
		_direction=obj_blue._face_direction	
		audio_play_sound(snd_slap,random_range(0.6,1.4),0)
	}