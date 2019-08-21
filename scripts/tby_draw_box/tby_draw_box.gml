/// @desc Draws a textboxy textbox, given the top left and bottom right corner. Uses the current active skin.
/// @param _x1
/// @param _y1
/// @param _x2
/// @param _y2
/// @param _skin_frame = tby_array_get(tby_default_skin, TbySkin.Frame)
var _x1 = argument[0], _y1 = argument[1], _x2 = argument[2], _y2 = argument[3];
var _skin_frame = argument_count > 4 ? argument[4] : tby_array_get(tby_default_skin, TbySkin.Frame);
var _ts = tby_tile_size
var _width_percentage = (1/_ts)*(_x2-_x1-_ts*2)
var _height_percentage = (1/_ts)*(_y2-_y1-_ts*2)

tby_draw_sprite(_skin_frame, _x1, _y1, TbyFrame.TopLeft)
tby_draw_sprite(_skin_frame, _x1+_ts, _y1, TbyFrame.TopMid, _width_percentage)
tby_draw_sprite(_skin_frame, _x2-_ts, _y1, TbyFrame.TopRight)

tby_draw_sprite(_skin_frame, _x1, _y1+_ts, TbyFrame.MidLeft, 1, _height_percentage)
tby_draw_sprite(_skin_frame, _x1+_ts, _y1+_ts, TbyFrame.Mid, _width_percentage, _height_percentage)
tby_draw_sprite(_skin_frame, _x2-_ts, _y1+_ts, TbyFrame.MidRight, 1, _height_percentage)

tby_draw_sprite(_skin_frame, _x1, _y2-_ts, TbyFrame.BotLeft)
tby_draw_sprite(_skin_frame, _x1+_ts, _y2-_ts, TbyFrame.BotMid, _width_percentage)
tby_draw_sprite(_skin_frame, _x2-_ts, _y2-_ts, TbyFrame.BotRight)