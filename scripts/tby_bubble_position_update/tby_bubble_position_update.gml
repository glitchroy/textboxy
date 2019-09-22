/// @desc Update the position of a TbyType.Bubble based on an instance.
/// @param _inst
var _inst = argument0;

// Called from textbox object only

var _dim/*:TbyDim*/ = self.dimensions;
var _padding = tby_tile_size;

var _offset = tby_bubble_offset_calculate(_inst, _dim[TbyDim.width], _dim[TbyDim.height])

_dim[@TbyDim.x] = _offset[0]
_dim[@TbyDim.y] = _offset[1]
x = _dim[TbyDim.x]
y = _dim[TbyDim.y]