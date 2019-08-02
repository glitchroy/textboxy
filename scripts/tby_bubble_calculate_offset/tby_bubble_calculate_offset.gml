/// @desc Returns the offset position on the top middle of an instance.
/// @param inst
/// @param width
/// @param height
var inst = argument0, width = argument1, height = argument2;

//calc top middle
var spr = inst.sprite_index;
var ix = inst.x - sprite_get_xoffset(spr) + sprite_get_width(spr)/2
var iy = inst.y - sprite_get_yoffset(spr)

var offsetWidth  = width / 2
var bubbleHeight = tby_tile_size;
var offsetHeight = height + bubbleHeight + tby_tile_size

return [floor(ix - offsetWidth), floor(iy - offsetHeight)]