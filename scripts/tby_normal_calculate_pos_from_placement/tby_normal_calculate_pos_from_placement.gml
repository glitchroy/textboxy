/// @desc Returns a TbyPos object based on the given TbyPlacement enum. Also calculates auto position.
/// @param _placement_enum
/// @param _line_number 
var _placement_enum = argument0, _line_number = argument1;

var _top = tby_pos_create_normal(tby_tile_size, _line_number);
var _mid = tby_pos_create_normal(tby_game_height/2 - (tby_pos_height_from_lines(_line_number))/2, _line_number);
var _bot = tby_pos_create_normal(tby_game_height - (tby_pos_height_from_lines(_line_number)+tby_tile_size), _line_number);

// Calculate auto position
if (_placement_enum == TbyPlacement.Auto) {
    var _player_inst = instance_find(tby_object_respect_auto_placement, 0);
    if (_player_inst == noone) return _bot;
    
    var _cam_y = 0;
    var _cam = view_camera[0];
    if (_cam != -1) {
        _cam_y = camera_get_view_y(_cam)
    }
    
    var _player_y = _player_inst.y - _cam_y;
    
    if (_player_y > tby_game_height/2) {
        return _top;
    } else {
        return _bot;
    }
}

switch (_placement_enum) {
    case TbyPlacement.Top:    return _top; break;
    case TbyPlacement.Middle: return _mid; break;
    case TbyPlacement.Bottom: return _bot; break;
}

return _bot;