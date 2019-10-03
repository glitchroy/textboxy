/// @param _type
/// @param _scribble
/// @param _padding
/// @param ?_placement = undefined
/// @param ?_instance = undefined
/// @param ?_bubble_height = undefined
var _type = argument[0], _scribble = argument[1], _padding = argument[2];
var _placement = argument_count > 3 ? argument[3] : undefined;
var _instance = argument_count > 4 ? argument[4] : undefined;
var _bubble_height = argument_count > 5 ? argument[5] : undefined;

var _x, _y, _width, _height = 0;

switch (_type) {
    case TbyType.Box:
    case TbyType.Choice:
        // Figure out X and Y
        _width = tby_box_width + _padding*2;
        var _lines = _type == TbyType.Box ? tby_box_lines_per_box : 3;
        _height = tby_dim_line_height(_lines) + _padding*2;
        
        _x = (tby_game_width - _width) / 2;
        
        switch (_placement) {
            case TbyPlacement.Top: _y = 0; break;
            case TbyPlacement.Middle: _y = tby_game_height/2 - _height/2; break;
            case TbyPlacement.Bottom: _y = tby_game_height - _height; break;
            case TbyPlacement.Auto:
                // Figure out placement
                var _i = tby_game_object_respect_auto;
                if (_i == noone) { 
                    _y = 0;
                    break;
                }
                var _cam_y = 0;
                var _cam = tby_game_camera;
                if (_cam != -1) {
                    _cam_y = camera_get_view_y(_cam);
                }
                var _iy = _i.y - _cam_y;
                
                // Assign Top or Bot
                _y = (_iy > tby_game_height/2) ? 0 : tby_game_height - _height;
            break;
        }
    break;
    case TbyType.Bubble:
        // Box at 0/0 with padding
        var _zero_box/*:SCRIBBLE_BOX*/ = scribble_get_box(
            _scribble,
            0,
            0,
            _padding,
            _padding,
            _padding,
            _padding
            );
        _width = _zero_box[SCRIBBLE_BOX.X1] - _zero_box[SCRIBBLE_BOX.X0];
        _height = _zero_box[SCRIBBLE_BOX.Y2] - _zero_box[SCRIBBLE_BOX.Y0];
            
        var _sprite = _instance.sprite_index;
        var _instance_middle = _instance.x - sprite_get_xoffset(_sprite) + sprite_get_width(_sprite)/2;
        var _instance_top = _instance.y - sprite_get_yoffset(_sprite);
        
        _x = floor(_instance_middle - _width/2);
        _y = floor(_instance_top - _bubble_height - _height);
    break;
}

var _dim/*:TbyDim*/ = array_create(TbyDim.sizeof);
_dim[@TbyDim.x_content] = _x + _padding;
_dim[@TbyDim.y_content] = _y + _padding;
_dim[@TbyDim.x1] = _x;
_dim[@TbyDim.y1] = _y;
_dim[@TbyDim.x2] = _x + _width;
_dim[@TbyDim.y2] = _y + _height;

return _dim;