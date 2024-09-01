// 绘制网格的碰撞体
/*
draw_set_font(fnt_debug)

for (var yy = 0; yy < cell_line; ++yy) 
{
	for (var xx = 0; xx < cell_column; ++xx) 
	{
		if terrainGrid[# xx,yy] != noone
		{
			draw_text(xx*cell_width+2,yy*cell_height+1,terrainGrid[# xx,yy].collidable)
		}
	}
}
/*