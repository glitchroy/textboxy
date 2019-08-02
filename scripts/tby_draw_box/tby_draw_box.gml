/// @desc Draws a textboxy textbox, given the top left and bottom right corner. Uses the current active skin.
/// @param x1
/// @param y1
/// @param x2
/// @param y2
//#args x1, y1, x2, y2
var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3;

var frame;
var branch = global.tby_active_branch;
if (tby_branch_exists(branch)) {
    frame = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Frame);
} else {
    frame = tby_array_get(tby_default_skin, TbySkin.Frame);
}

var ts = tby_tile_size
var widthPercentage = (1/ts)*(x2-x1-ts*2)
var heightPercentage = (1/ts)*(y2-y1-ts*2)

tby_draw_sprite(frame, x1, y1, TbyFrame.TopLeft)
tby_draw_sprite(frame, x1+ts, y1, TbyFrame.TopMid, widthPercentage)
tby_draw_sprite(frame, x2-ts, y1, TbyFrame.TopRight)

tby_draw_sprite(frame, x1, y1+ts, TbyFrame.MidLeft, 1, heightPercentage)
tby_draw_sprite(frame, x1+ts, y1+ts, TbyFrame.Mid, widthPercentage, heightPercentage)
tby_draw_sprite(frame, x2-ts, y1+ts, TbyFrame.MidRight, 1, heightPercentage)

tby_draw_sprite(frame, x1, y2-ts, TbyFrame.BotLeft)
tby_draw_sprite(frame, x1+ts, y2-ts, TbyFrame.BotMid, widthPercentage)
tby_draw_sprite(frame, x2-ts, y2-ts, TbyFrame.BotRight)