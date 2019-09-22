/// @desc Returns the offset position on the top middle of an instance.
/// @param _inst
/// @param _width
/// @param _height
var _inst = argument0, _width = argument1, _height = argument2;

//calc top middle
var _spr = _inst.sprite_index;
var _ix = _inst.x - sprite_get_xoffset(_spr) + sprite_get_width(_spr)/2
var _iy = _inst.y - sprite_get_yoffset(_spr)

var _offset_width  = _width / 2
var _bubble_height = tby_tile_size;
var _offset_height = _height + _bubble_height + tby_tile_size

return [floor(_ix - _offset_width), floor(_iy - _offset_height)]