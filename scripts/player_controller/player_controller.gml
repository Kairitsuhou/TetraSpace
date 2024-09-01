// 映射
function player_input()
{
	left	= keyboard_check(ord("A"));
	right	= keyboard_check(ord("D"));

	jump	= keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));

	restart = keyboard_check(ord("R"));
}

function is_move()
{
	return left or right;
}

function is_jump()
{
	return jump;
}