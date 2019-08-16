/// @desc Draws a sprite with position and scaling.
/// @param _sprite
/// @param _sx
/// @param _sy
/// @param _subimg = -1
/// @param _xscale = 1
/// @param _yscale = 1
var _sprite = argument[0], _sx = argument[1], _sy = argument[2];
var _subimg = argument_count > 3 ? argument[3] : -1;
var _xscale = argument_count > 4 ? argument[4] : 1;
var _yscale = argument_count > 5 ? argument[5] : 1;

draw_sprite_ext(_sprite, _subimg, _sx, _sy, _xscale, _yscale, 0, c_white, 1)