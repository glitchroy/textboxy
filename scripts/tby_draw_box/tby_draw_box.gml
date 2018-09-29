/// @param bx
/// @param by
/// @param bw
/// @param bh
//#args bx, by, bw, bh
var bx = argument0, by = argument1, bw = argument2, bh = argument3;

var frame = tby_array_get(tby_default_skin, TbySkin.Frame);
var ts = tby_tile_size
var widthPercentage = (1/ts)*(bw-ts)
var heightPercentage = (1/ts)*(bh-ts)

tby_draw_sprite(frame, bx, by, TbyFrame.TopLeft)
tby_draw_sprite(frame, bx+ts, by, TbyFrame.TopMid, widthPercentage)
tby_draw_sprite(frame, bx+bw-ts, by, TbyFrame.TopRight)

tby_draw_sprite(frame, bx, by+ts, TbyFrame.MidLeft, 1, heightPercentage)
tby_draw_sprite(frame, bx+ts, by+ts, TbyFrame.Mid, widthPercentage, heightPercentage)
tby_draw_sprite(frame, bx+bw-ts, by+ts, TbyFrame.MidRight, 1, heightPercentage)

tby_draw_sprite(frame, bx, by+bh-ts, TbyFrame.BotLeft)
tby_draw_sprite(frame, bx+ts, by+bh-ts, TbyFrame.BotMid, widthPercentage)
tby_draw_sprite(frame, bx+bw-ts, by+bh-ts, TbyFrame.BotRight)