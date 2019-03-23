/// @param placementEnum
/// @param lineNumber 
var placementEnum = argument0, lineNumber = argument1;

var top = tby_pos_create_normal(tby_tile_size, lineNumber);
var mid = tby_pos_create_normal(tby_game_height/2 - (tby_pos_height_from_lines(lineNumber))/2, lineNumber);
var bot = tby_pos_create_normal(tby_game_height - (tby_pos_height_from_lines(lineNumber)+tby_tile_size), lineNumber);

{/*!#lamdef __lf_tby_normal_get_placement_from_enum_calculate_auto_position*/}

switch (placementEnum) {
    case TbyPlacement.Top:    return top; break;
    case TbyPlacement.Middle: return mid; break;
    case TbyPlacement.Bottom: return bot; break;
    case TbyPlacement.Auto:   return __lf_tby_normal_get_placement_from_enum_calculate_auto_position(top, bot); break;
}

return bot;