/// @param _dim
/// @param _instance
/// @param _bubble_height
var _dim/*:TbyDim*/ = argument0, _instance = argument1, _bubble_height = argument2;

var _width = _dim[TbyDim.x1] + _dim[TbyDim.x2];
var _height = _dim[TbyDim.y1] + _dim[TbyDim.y2];

var _sprite = _instance.sprite_index;
var _instance_middle = _instance.x - sprite_get_xoffset(_sprite) + sprite_get_width(_sprite)/2;
var _instance_top = _instance.y - sprite_get_yoffset(_sprite);

_delta_x = _dim[TbyDim.x1] - floor(_instance_middle - _width/2);
_delta_y = _dim[TbyDim.y1] - floor(_instance_top - _bubble_height - _height);

_dim[@TbyDim.x_content] += _delta_x;
_dim[@TbyDim.y_content] += _delta_y;
_dim[@TbyDim.x1] += _delta_x;
_dim[@TbyDim.y1] += _delta_y;
_dim[@TbyDim.x2] += _delta_x;
_dim[@TbyDim.y2] += _delta_y;