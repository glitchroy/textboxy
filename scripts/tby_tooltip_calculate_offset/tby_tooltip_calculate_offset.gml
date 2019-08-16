/// @param _tx
/// @param _ty
/// @param _width
/// @param _height
var _tx = argument0, _ty = argument1, _width = argument2, _height = argument3;

var _offset_width  = _width / 2
var _bubble_height = tby_tile_size;
var _offset_height = _height + _bubble_height + tby_tile_size

return [floor(_tx - _offset_width), floor(_ty - _offset_height)]