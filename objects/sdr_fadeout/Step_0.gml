fade_alpha += fade_speed * fade_direction;
if (fade_alpha >= 1) {
    fade_alpha = 1;
    fade_direction = -1; // Start fading out
    // 切换到下一个关卡
    room_goto_next()
} else if (fade_alpha <= 0) {
    fade_alpha = 0;
    instance_destroy(); // 销毁渐变对象
}