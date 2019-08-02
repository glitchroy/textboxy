/// @desc Draws a debug string with a semi-transparent background box. Internal use only.
/// @param tx
/// @param ty
/// @param text
var tx = argument0, ty = argument1, text = argument2;

draw_set_font(fontTbyDebug);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(tx, ty, tx+string_width(text), ty+string_height(text)-1, false)
draw_set_alpha(1);

draw_set_color(c_black);
draw_text(tx+1, ty+1, text);

draw_set_color(c_white);
draw_text(tx, ty, text);