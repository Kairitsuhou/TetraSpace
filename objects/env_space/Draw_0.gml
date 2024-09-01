if sprite_index != noone
{
	var frame_x = (x+cell_width*0.5) div cell_width * cell_width
	var frame_y = (y+cell_height*0.5) div cell_height * cell_height
	
	shader_set(sdr_whiteFrame)
	draw_sprite(sprite_index,1,frame_x,frame_y)
	shader_reset()
}


draw_sprite(sprite_index,0,x,y)
//draw_sprite(sprite_index,1,x,y)


// 状态机标记
//draw_text(x+2,y+2,block_state.curr_state_name)

