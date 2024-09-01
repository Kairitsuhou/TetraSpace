// 判断当前动画是否与状态机应处在的状态所代表的动画相同，不同则改变当前动画
function animation_set(animation)
{
	if sprite_index != animation
	{
		sprite_index = animation;
		image_index = 0;
	}
}

// 设置动画当前运行到某帧
function animation_at(frame_index)
{
	var fixed_frame = image_speed*(sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps))
	if image_index > frame_index and image_index <= frame_index + fixed_frame
	{
		return true;
	}
	else
	{
		return false;
	}
}

// 设置动画当前运行到某帧
function animation_between(frame_index1,frame_index2)
{
	//var fixed_frame = image_speed*(sprite_get_speed(anm_player_shoot_strip8)/game_get_speed(gamespeed_fps))
	if image_index > frame_index1 and image_index <= frame_index2
	{
		return true;
	}
	else
	{
		return false;
	}
}

// 设置动画当前运行到某帧
function animation_end()
{
	var fixed_frame = image_speed*(sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps))
	if image_index > image_number-1-fixed_frame and image_index <= image_number-1
	{
		return true;
	}
	else
	{
		return false;
	}
}

