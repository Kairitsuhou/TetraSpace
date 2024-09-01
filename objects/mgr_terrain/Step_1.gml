if setAllObstacle
{
	setAllObstacle = false
	instance_destroy(col_obstacle)
	for (var yy = 0; yy < cell_line; ++yy) 
	{
		for (var xx = 0; xx < cell_column; ++xx) 
		{
			var x1 = xx*cell_width
			var y1 = yy*cell_height
			var x2 = x1+cell_width
			var y2 = y1+cell_height
			
			var cell = noone
			if not collision_rectangle(x1,y1,x2,y2,env_space,true,false)
			{
				cell = instance_create_layer(xx*cell_width,yy*cell_height,"Level_Middle",col_obstacle)
			}
			
			terrainGrid[# xx,yy] = cell
		}
	}
}