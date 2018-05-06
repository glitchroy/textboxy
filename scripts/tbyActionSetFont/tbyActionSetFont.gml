///@function tbyActionSetFont(fontResource)
///@desc This should not be called manually
///@param maxLines

var m = tbyM();
m.currentFont = argument0;
draw_set_font(argument0);
m.lineHeight = string_height(ord("W"));