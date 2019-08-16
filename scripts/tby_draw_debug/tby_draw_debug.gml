/// @desc Draws a debug string with a semi-transparent background box. Internal use only.
/// @param _tx
/// @param _ty
/// @param _text
var _tx = argument0, _ty = argument1, _text = argument2;

draw_set_font(fontTbyDebug);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_tx, _ty, _tx+string_width(_text), _ty+string_height(_text)-1, false)
draw_set_alpha(1);

draw_set_color(c_black);
draw_text(_tx+1, _ty+1, _text);

draw_set_color(c_white);
draw_text(_tx, _ty, _text);