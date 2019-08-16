/// @desc Returns a TbyPos object based on the given TbyPlacement enum. Also calculates auto position.
/// @param _placement_enum
/// @param _line_number 
var _placement_enum = argument0, _line_number = argument1;

var _top = tby_pos_create_normal(tby_tile_size, _line_number);
var _mid = tby_pos_create_normal(tby_game_height/2 - (tby_pos_height_from_lines(_line_number))/2, _line_number);
var _bot = tby_pos_create_normal(tby_game_height - (tby_pos_height_from_lines(_line_number)+tby_tile_size), _line_number);

{/*!#lamdef __lf_tby_normal_get_placement_from_enum_calculate_auto_position*/}

switch (_placement_enum) {
    case TbyPlacement.Top:    return _top; break;
    case TbyPlacement.Middle: return _mid; break;
    case TbyPlacement.Bottom: return _bot; break;
    case TbyPlacement.Auto:   return __lf_tby_normal_get_placement_from_enum_calculate_auto_position(_top, _bot); break;
}

return _bot;