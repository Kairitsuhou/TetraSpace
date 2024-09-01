// 状态机
block_state = init_state_machine();
set_init_state(block_state,"Idle");

add_state(block_state,"Idle");
add_state(block_state,"Drag");
add_state(block_state,"null");

mouseOver = false

x_offset = 0
y_offset = 0

ori_x = 0
ori_y = 0

var mask = instance_create_layer(x,y,"Level_Front",env_mask)
mask.sprite_index = sprite_index
mask.image_index = 1

containInstances = ds_list_create()
instance_place_list(x,y,env_mask,containInstances,false)
instance_place_list(x,y,env_all,containInstances,false)
instance_place_list(x,y,col_door,containInstances,false)
instance_place_list(x,y,col_wall,containInstances,false)