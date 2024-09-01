fade_alpha -= fade_speed; // 渐入效果
if (fade_alpha <= 0) {
    fade_alpha = 0;
    instance_destroy(); // 渐入完成后销毁渐变对象
}