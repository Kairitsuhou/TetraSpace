walk_speed = 2;
jump_speed = 6.5

speed_acc = 0.9

// 移动和跳跃基本判定
hsp = 0;// horizontal speed - 水平速度
vsp = 0;// vertical speed - 垂直速度

grav = 0.3;// 重力

move_direction = 0;
face_towards = 1;

// 状态机
character_state = init_state_machine();
set_init_state(character_state,"idle");

add_state(character_state,"idle");
add_state(character_state,"walk");
add_state(character_state,"rise");
add_state(character_state,"fall");
add_state(character_state,"static");
add_state(character_state,"null");

set_player_animation();

// 状态机阶段
shoot_stage = 0;
row_stage = 0;