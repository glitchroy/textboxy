/// @param inst
/// @param wPos
/// @param hPos
var inst = argument0, wPos = argument1, hPos = argument2;

var offset = tby_bubble_calculate_offset(inst, wPos, hPos)

return [offset[0], offset[1], wPos, hPos]