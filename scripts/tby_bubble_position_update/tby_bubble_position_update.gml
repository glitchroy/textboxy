/// @desc Update the position of a TbyType.Bubble based on an instance.
/// @param _inst
var _inst = argument0;

// Called from textbox object only

var _dim/*:TbyDimOld*/ = self.dimensions;

var _offset = tby_bubble_offset_calculate(_inst, _dim[TbyDimOld.width], _dim[TbyDimOld.height])

_dim[@TbyDimOld.x] = _offset[0]
_dim[@TbyDimOld.y] = _offset[1]
x = _dim[TbyDimOld.x]
y = _dim[TbyDimOld.y]