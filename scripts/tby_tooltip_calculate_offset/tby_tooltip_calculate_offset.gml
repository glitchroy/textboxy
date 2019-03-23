/// @param tx
/// @param ty
/// @param width
/// @param height
var tx = argument0, ty = argument1, width = argument2, height = argument3;

var offsetWidth  = width / 2
var bubbleHeight = tby_tile_size;
var offsetHeight = height + bubbleHeight + tby_tile_size

return [floor(tx - offsetWidth), floor(ty - offsetHeight)]