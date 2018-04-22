///@function tbyDrawString(string, x, y, font)
///@desc Draws text with box offset
///@param string
///@param x
///@param y
///@param font

draw_set_font(argument3)
draw_set_color(c_white);

draw_text(argument1+tbyTileSize,
		  argument2+tbyTileSize,
		  argument0);