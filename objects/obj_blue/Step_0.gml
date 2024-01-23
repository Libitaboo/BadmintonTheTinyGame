if 	global.red_score>=21{
	exit}
image_angle=_face_direction-90
if obj_shuttlecock._on_hand_who!="blue" and !obj_shuttlecock._on_hand{
	if y>374{y=374}
	if y<106{y=106}
	if x<70{x=70}
	if x>472{x=472}
}else{
	_serve_colddown++
	if global.blue_score mod 2=0{
			if y>302{y=302}
			if y<106{y=106}
			if x<70{x=70}
			if x>270{x=270}
			if _timer mod 15=0
				_face_direction=irandom_range(290,330)
	}else{
			if y>302{y=302}
			if y<106{y=106}
			if x>472{x=472}
			if x<270{x=270}
			if _timer mod 15=0
				_face_direction=irandom_range(210,250)
	}
	if _timer mod 30=0 and obj_shuttlecock._on_hand_who="blue"  and obj_shuttlecock._on_hand {
		_move_direction=irandom_range(0,360)
	}
	if _timer mod 15=0 and obj_shuttlecock._on_hand_who!="blue"  and !obj_shuttlecock._on_hand {
		_move_direction=lerp(_move_direction,point_direction(x,y,mouse_x,mouse_y),0.1)
	}
	move_towards_point(x+cos(degtorad(_move_direction))*5,
	y-sin(degtorad(_move_direction))*5,5)
	
	if collision_line(x,y,x+cos(degtorad(_face_direction))*999,
	y-sin(degtorad(_face_direction))*999,obj_red,1,1) and _colddown=0 and global.owner="blue"
	and obj_shuttlecock._on_hand and _serve_colddown>=80{
		if random(1)>0.4{
			_hitting=1
			image_speed=2
			_wait=5
			obj_shuttlecock._z_speed=-random_range(1.4,2)
			obj_shuttlecock._on_hand=0
			obj_shuttlecock._direction=_face_direction
			_colddown=10
			_serve_colddown=0
		}
	}
}
if obj_shuttlecock.y<376 and !obj_shuttlecock._on_hand{
	move_towards_point(x+cos(degtorad(point_direction(x,y,obj_shuttlecock.x,obj_shuttlecock.y)))*5,
	y-sin(degtorad(point_direction(x,y,obj_shuttlecock.x,obj_shuttlecock.y)))*5,5)
}
_timer++
if image_index=3{
	image_speed=0
	if _wait=0{
		
		image_index=0
		_hitting=0
	}else{
		_wait--
	}
}
if _colddown>0{_colddown--}
if collision_point(x,y,obj_shuttlecock,1,1) and 
_colddown=0 and !obj_shuttlecock._on_hand {
	_face_direction=point_direction(x,y,obj_red.x,obj_red.y)
	_hitting=1
	image_speed=2
	_wait=5
	if obj_shuttlecock._z<=2{
	obj_shuttlecock._direction=_face_direction}
	_colddown=10
}