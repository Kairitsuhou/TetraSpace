function set_jump_speed(spd)
{
	vsp = -spd
}

function set_move_direction()
{
	move_direction = right - left;
}

function set_face_towards()
{
	if move_direction != 0 face_towards = move_direction;
	image_xscale = face_towards;
}

function set_x_speed(spd)
{
	hsp = spd
}

function set_x_speed_ext(spd,acc)
{
	if move_direction != 0
	{
		hsp = spd
	}
	else
	{
		hsp = lerp(0,hsp,acc);
	}
}

function set_y_speed(spd)
{
	vsp = spd
}

function set_coordirate()
{
	x += hsp;
	y += vsp;
}

function by_gravity()
{
	vsp += grav;
}