var _player_near = collision_rectangle(x-8, y-8, x+16, y+16, objRed, false, true)
if (_player_near && !global.in_dialogue_pause) {
    var _t/*:TbyTooltip*/ = tooltip_talk;
    tby_tooltip_show(_t, x+sprite_width/2, y);
}