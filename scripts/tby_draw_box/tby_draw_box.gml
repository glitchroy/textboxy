/// @desc Draws a textboxy textbox, given the top left and bottom right corner. Uses the current active skin.
/// @param _x1
/// @param _y1
/// @param _x2
/// @param _y2
var _x1 = argument0, _y1 = argument1, _x2 = argument2, _y2 = argument3;

var _frame;
var _branch = global.tby_active_branch;
if (tby_branch_exists(_branch)) {
    _frame = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Frame);
} else {
    _frame = tby_array_get(tby_default_skin, TbySkin.Frame);
}

var _ts = tby_tile_size
var _width_percentage = (1/_ts)*(_x2-_x1-_ts*2)
var _height_percentage = (1/_ts)*(_y2-_y1-_ts*2)

tby_draw_sprite(_frame, _x1, _y1, TbyFrame.TopLeft)
tby_draw_sprite(_frame, _x1+_ts, _y1, TbyFrame.TopMid, _width_percentage)
tby_draw_sprite(_frame, _x2-_ts, _y1, TbyFrame.TopRight)

tby_draw_sprite(_frame, _x1, _y1+_ts, TbyFrame.MidLeft, 1, _height_percentage)
tby_draw_sprite(_frame, _x1+_ts, _y1+_ts, TbyFrame.Mid, _width_percentage, _height_percentage)
tby_draw_sprite(_frame, _x2-_ts, _y1+_ts, TbyFrame.MidRight, 1, _height_percentage)

tby_draw_sprite(_frame, _x1, _y2-_ts, TbyFrame.BotLeft)
tby_draw_sprite(_frame, _x1+_ts, _y2-_ts, TbyFrame.BotMid, _width_percentage)
tby_draw_sprite(_frame, _x2-_ts, _y2-_ts, TbyFrame.BotRight)