var playerNear = collision_rectangle(x-8, y-8, x+16, y+16, objRed, false, true)
if (playerNear && !global.inDialoguePause) {
    tby_tooltip_show("blue-tip", x+sprite_width/2, y);
}