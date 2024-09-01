// 状态机
switch(block_state.curr_state_name)
{
	#region Idle
	case "Idle" :
		#region step into state, just excute for 1 frame
		if is_enter_state(block_state)
		{
			enter_state(block_state);
			
		}
		#endregion
		
		#region State Logic
		
		if mouseOver and mouse_check_button_pressed(mb_left)
		{
			set_next_state(block_state,"Drag");
			
			ori_x = x
			ori_y = y
			
			x_offset = mouse_x - x
			y_offset = mouse_y - y
			
			//ds_list_clear(containInstances)
			
			instance_place_list(x,y,cha_player,containInstances,false)
			
			var num = ds_list_size(containInstances)
			
			for (var i = 0; i < num; ++i) 
			{
				if containInstances[| i].object_index == cha_player
				{
					set_next_state(cha_player.character_state,"static")
				}
				
				containInstances[| i].drag_x_offset = x - containInstances[| i].x
				containInstances[| i].drag_y_offset = y - containInstances[| i].y
			}
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(block_state)
		{
			leave_state(block_state);
			// code here
		}
		#endregion
	break;
	#endregion

	#region Drag
	case "Drag" :
		#region step into state, just excute for 1 frame
		if is_enter_state(block_state)
		{
			enter_state(block_state);
			
		}
		#endregion
		
		#region State Logic
		
		
		x = mouse_x - x_offset
		y = mouse_y - y_offset
		
		if x < 0 x = 0
		if y < 0 y = 0
		if x+sprite_width > room_width x = room_width-sprite_width
		if y+sprite_height > room_height y = room_height-sprite_height
		
		var num = ds_list_size(containInstances)
		for (var i = 0; i < num; ++i) 
		{
			containInstances[| i].x = x - containInstances[| i].drag_x_offset
			containInstances[| i].y = y - containInstances[| i].drag_y_offset
		}
		
		if mouse_check_button_released(mb_left)
		{
			var target_x = (x+cell_width*0.5) div cell_width * cell_width
			var target_y = (y+cell_height*0.5) div cell_height * cell_height
			
			if place_meeting(target_x,target_y,env_space)
			{
				x = ori_x
				y = ori_y
			}
			else
			{
				x = target_x
				y = target_y
			}
			
			for (var i = 0; i < num; ++i) 
			{
				if containInstances[| i].object_index == cha_player
				{
					set_next_state(cha_player.character_state,"idle")
				}
				
				containInstances[| i].x = x - containInstances[| i].drag_x_offset
				containInstances[| i].y = y - containInstances[| i].drag_y_offset
			}
			
			var pos = ds_list_find_index(containInstances,instance_find(cha_player,0))
			ds_list_delete(containInstances,pos)
			
			mgr_terrain.setAllObstacle = true
			set_next_state(block_state,"Idle")
		}
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(block_state)
		{
			leave_state(block_state);
			
		}
		#endregion
	break;
	#endregion

	#region Null
	case "Null" :
		#region step into state, just excute for 1 frame
		if is_enter_state(block_state)
		{
			enter_state(block_state);
			// code here
		}
		#endregion
		
		#region State Logic
		
		
		#endregion
		
		#region step out state, just excute for 1 frame
		if is_leave_state(block_state)
		{
			leave_state(block_state);
			// code here
		}
		#endregion
	break;
	#endregion
}

#region State Jump
if is_jump_state(block_state)
{
	jump_state(block_state)
}
#endregion

