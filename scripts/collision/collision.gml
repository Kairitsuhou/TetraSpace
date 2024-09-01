function is_collide_x(dis,obj)
{
	var inst = instance_place(x+dis,y,obj) 
	if inst == noone
	{
		return false
	}
	else
	{
		return inst.collidable
	}
}

function is_collide_y(dis,obj)
{
	var inst = instance_place(x,y+dis,obj)
	if inst == noone
	{
		return false
	}
	else
	{
		return inst.collidable
	}
}

function collide_fix_x(dis,obj)
{
	var one_pixel = sign(dis);
	while not place_meeting(x+one_pixel,y,obj)
	{
		x += one_pixel;
	}
}

function collide_fix_y(dis,obj)
{
	var one_pixel = sign(dis);
	while not place_meeting(x,y+one_pixel,obj)
	{
		y += one_pixel;
	}
}

function collide_vertical(object)
{
	// 垂直碰撞修复
	var inst = instance_place(x,y+vsp,object)
	if inst != noone and inst.collidable
	{
		var normal_speed = sign(vsp);
		while not place_meeting(x,y+normal_speed,object)
		{
			y += normal_speed;
		}
		vsp = 0;
	}
}
	
	
function collide_horizontal(object)
{
	// 水平碰撞修复
	var inst = instance_place(x+hsp,y,object)
	if inst != noone and inst.collidable
	{
		var normal_speed = sign(hsp);
		while(not place_meeting(x+normal_speed,y,object))
		{
			x += normal_speed;
		}
		hsp = 0;
	}
}

function is_on_ground(object)
{
	//落地判断
	var inst = instance_place(x,y+1,object)
	if inst == noone
	{
		return false
	}
	else
	{
		return inst.collidable
	}
}