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
        _height = tby_dim_line_height(_scribble, _lines) + _padding*2;
        
        _x = (tby_game_width - _width) / 2;
        _y = __lf_tby_dim_create_(_placement, _height);
    break;
    case TbyType.Bubble:
        // Box at 0/0 with padding
        var _zero_box/*:SCRIBBLE_BOX*/ = scribble_get_bbox(
            _scribble,
            0,
            0,
            _padding,
            _padding,
            _padding,
            _padding
            );
        _width = _zero_box[SCRIBBLE_BOX.TR_X] - _zero_box[SCRIBBLE_BOX.TL_X];
        _height = _zero_box[SCRIBBLE_BOX.BL_Y] - _zero_box[SCRIBBLE_BOX.TL_Y];
            
        var _sprite = _instance.sprite_index;
        var _sprite_width = 16;

        if (_sprite != -1) {
            _sprite_width = sprite_get_width(_sprite);
        }
        
        var _instance_middle = tby_dim_gui_x(_instance.x) - sprite_get_xoffset(_sprite) + _sprite_width/2;
        var _instance_top = tby_dim_gui_y(_instance.y) - sprite_get_yoffset(_sprite);
        
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