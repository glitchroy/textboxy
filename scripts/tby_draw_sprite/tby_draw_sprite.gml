/// @desc Draws a sprite with position and scaling.
/// @param sprite
/// @param sx
/// @param sy
/// @param subimg = -1
/// @param xscale = 1
/// @param yscale = 1
var sprite = argument[0], sx = argument[1], sy = argument[2];
var subimg = argument_count > 3 ? argument[3] : -1;
var xscale = argument_count > 4 ? argument[4] : 1;
var yscale = argument_count > 5 ? argument[5] : 1;

draw_sprite_ext(sprite, subimg, sx, sy, xscale, yscale, 0, c_white, 1)