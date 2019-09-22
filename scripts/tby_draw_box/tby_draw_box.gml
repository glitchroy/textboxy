/// @desc Draws a textboxy textbox, given the top left and bottom right corner. Uses the current active skin.
/// @param _x1
/// @param _y1
/// @param _x2
/// @param _y2
/// @param _sprite = tby_array_get(tby_default_skin, TbySkin.Frame)
var _x1 = argument[0], _y1 = argument[1], _x2 = argument[2], _y2 = argument[3];
var _sprite = argument_count > 4 ? argument[4] : tby_array_get(tby_default_skin, TbySkin.Frame);
var _size = tby_tile_size
var _width  = (_x2 - _x1) / _size
var _height = (_y2 - _y1) / _size

// One tile scale unit
var _u = 2;

// Middle
draw_sprite_part_ext(_sprite, -1, _size*1, _size*1, _size, _size, _x1+_size, _y1+_size, _width-_u, _height-_u, c_white, 1)

// Row Top
draw_sprite_part_ext(_sprite, -1, _size*1, 0,       _size, _size, _x1+_size, _y1,       _width-_u, 1,          c_white, 1)
// Row Left
draw_sprite_part_ext(_sprite, -1, 0,       _size*1, _size, _size, _x1,       _y1+_size, 1,         _height-_u, c_white, 1)
// Row Right
draw_sprite_part_ext(_sprite, -1, _size*2, _size*1, _size, _size, _x2-_size, _y1+_size, 1,         _height-_u, c_white, 1)
// Row Bottom
draw_sprite_part_ext(_sprite, -1, _size*1, _size*2, _size, _size, _x1+_size, _y2-_size, _width-_u, 1,          c_white, 1)

// Top Left
draw_sprite_part(_sprite, -1, 0,       0,       _size, _size, _x1,       _y1)
// Top Right
draw_sprite_part(_sprite, -1, _size*2, 0,       _size, _size, _x2-_size, _y1)
// Bottom Left
draw_sprite_part(_sprite, -1, 0,       _size*2, _size, _size, _x1,       _y2-_size)
// Bottom Right
draw_sprite_part(_sprite, -1, _size*2, _size*2, _size, _size, _x2-_size, _y2-_size);