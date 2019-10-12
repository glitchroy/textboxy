/// @desc Draws a debug string with a semi-transparent background box. Internal use only.
/// @param _tx
/// @param _ty
/// @param _text
/// @param _max_width = -1
/// @param _color = c_white
var _tx = argument[0], _ty = argument[1], _text = argument[2];
var _max_width = argument_count > 3 ? argument[3] : -1;
var _color = argument_count > 4 ? argument[4] : c_white;

draw_set_font(fontTbyDebug);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_tx-1, _ty,
               _tx+string_width_ext(_text, -1, _max_width),
               _ty+string_height_ext(_text, -1, _max_width)-1,
               false);
draw_set_alpha(1);

draw_set_color(c_black);
draw_text_ext(_tx+1, _ty+1, _text, -1, _max_width);

draw_set_color(_color);
draw_text_ext(_tx, _ty, _text, -1, _max_width);