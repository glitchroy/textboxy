/// @param placementEnum
/// @param lineNumber = tby_box_lines_per_tb
var placementEnum = argument[0];
var lineNumber = argument_count > 1 ? argument[1] : tby_box_lines_per_tb;

var top = tby_pos_create_normal(0, lineNumber);
var mid = tby_pos_create_normal(tby_game_height/2 - (tby_pos_height_from_lines(lineNumber)+tby_tile_size)/2, lineNumber);
var bot = tby_pos_create_normal(tby_game_height - (tby_pos_height_from_lines(lineNumber)+tby_tile_size*2), lineNumber);

{/*!#lamdef __lf_tby_normal_get_placement_from_enum_calculate_auto_position*/}

switch (placementEnum) {
    case TbyPlacement.Top:    return top; break;
    case TbyPlacement.Middle: return mid; break;
    case TbyPlacement.Bottom: return bot; break;
    case TbyPlacement.Auto:   return __lf_tby_normal_get_placement_from_enum_calculate_auto_position(top, bot); break;
}

return bot;