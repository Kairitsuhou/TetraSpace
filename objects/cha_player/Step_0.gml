// 操作映射自定义变量
player_input();

if restart
{
	game_restart();
}

// 状态机
switch(character_state.curr_state_name)
{
	#region Idle
	case "idle" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			animation_set(anm_idle);
			vsp = 0;
		}
		#endregion
		
		#region State Logic
		
		if is_move() // to walk
		{
			set_next_state(character_state,"walk");
		}
		
		if is_jump() // to jump
		{
			set_next_state(character_state,"rise");
			set_jump_speed(jump_speed);
		}
		
		if not is_on_ground(col_collider)
		{
			set_next_state(character_state,"fall");
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
	
	#region Walk
	case "walk" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			animation_set(anm_walk);
			vsp = 0;
		}
		#endregion
		
		#region State Logic
		
		set_move_direction();
		set_x_speed(move_direction*walk_speed);
		set_face_towards();
		
				
		if is_collide_x(hsp,col_collider)
		{
			collide_horizontal(col_collider)
		}
		
		set_coordirate()
		
		if not is_move() // to idle
		{
			set_next_state(character_state,"idle");
		}
		
		if is_jump() // to rise
		{
			set_next_state(character_state,"rise");
			set_jump_speed(jump_speed);
		}
		
		if not is_on_ground(col_collider) // to fall
		{
			set_next_state(character_state,"fall");
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
	
	#region Rise
	case "rise" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			animation_set(anm_rise);
		}
		#endregion
		
		#region State Logic
		
		set_move_direction();
		set_face_towards();
		set_x_speed_ext(face_towards*walk_speed,speed_acc);
		
		if is_collide_x(hsp,col_collider)
		{
			collide_horizontal(col_collider)
		}
		
		if is_collide_y(vsp,col_collider)
		{
			collide_vertical(col_collider)
		}
		
		set_coordirate();
		by_gravity();
		
		if vsp >= 0 // to fall
		{
			set_next_state(character_state,"fall");
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
	
	#region Fall
	case "fall" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			animation_set(anm_fall);
		}
		#endregion
		
		#region State Logic
		
		set_move_direction();
		set_face_towards();
		set_x_speed_ext(face_towards*walk_speed,speed_acc);
		
		//if is_collide_x(hsp,lev_floor)
		//{
		//	collide_horizontal(lev_floor)
		//}
		
		//if is_collide_y(vsp,lev_floor)
		//{
		//	collide_vertical(lev_floor)
		//}
		collide_horizontal(col_collider)
		collide_vertical(col_collider)
		
		set_coordirate();
		by_gravity();
	
		if is_on_ground(col_collider) // to idle
		{
			set_next_state(character_state,"idle");
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
	
	#region Static
	case "static" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			// code here
		}
		#endregion
		
		#region State Logic
		
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
	
	#region Null
	case "null" :
		#region step into state, just excute for 1 frame
		if is_enter_state(character_state)
		{
			enter_state(character_state);
			// code here
		}
		#endregion
		
		#region State Logic
		
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(character_state)
		{
			leave_state(character_state);
			// code here
		}
		#endregion
	break;
	#endregion
}

#region State Jump
if is_jump_state(character_state)
{
	jump_state(character_state)
}
#endregion

