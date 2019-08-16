/// @desc Update the position of a TbyType.Bubble based on an instance.
/// @param _inst
var _inst = argument0;

// Called from textbox object only

var _pos/*:TbyPos*/ = self.pos;
var _padding = tby_tile_size;

var _offset = tby_bubble_calculate_offset(_inst, _pos[TbyPos.width], _pos[TbyPos.height])

_pos[@TbyPos.x] = _offset[0]
_pos[@TbyPos.y] = _offset[1]
x = _pos[TbyPos.x]
y = _pos[TbyPos.y]