// 创建碰撞表格
#macro cell_width 16
#macro cell_height 16

#macro cell_column room_width div cell_width + 1
#macro cell_line room_height div cell_height + 1

terrainGrid = ds_grid_create(cell_column,cell_line)

//ds_grid_set_region(terrainGrid,0,0,cell_column-1,cell_line-1,1)

for (var yy = 0; yy < cell_line; ++yy) 
{
	for (var xx = 0; xx < cell_column; ++xx) 
	{
		var cell = instance_create_layer(xx*cell_width,yy*cell_height,"Level_Middle",col_obstacle)
		terrainGrid[# xx,yy] = cell
	}
}

setAllObstacle = true

