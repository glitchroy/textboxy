/// @param _dim
/// @param _clamp_x1
/// @param _clamp_y1
/// @param _clamp_x2
/// @param _clamp_y2
var _dim/*:TbyDim*/ = argument0, _clamp_x1 = argument1, _clamp_y1 = argument2, _clamp_x2 = argument3, _clamp_y2 = argument4;

draw_bubble_sprite = true;

if (_dim[TbyDim.x1] < _clamp_x1) { _dim[@TbyDim.x1] = _clamp_x1; draw_bubble_sprite = false; }
if (_dim[TbyDim.y1] < _clamp_y1) { _dim[@TbyDim.y1] = _clamp_y1; draw_bubble_sprite = false; }

if (_dim[TbyDim.x2] > _clamp_x2) { _dim[@TbyDim.x2] = _clamp_x2; draw_bubble_sprite = false; }
if (_dim[TbyDim.y2] > _clamp_y2) { _dim[@TbyDim.y2] = _clamp_y2; draw_bubble_sprite = false; }
