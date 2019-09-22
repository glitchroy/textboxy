/// @desc Returns the dimensions of a TbyNormal textbox, given the line numbers and y-_dim.
/// @param _y_pos
/// @param _line_number = tby_normal_lines_per_box
var _y_pos = argument[0];
var _line_number = argument_count > 1 ? argument[1] : tby_normal_lines_per_box;

var _x_pos = tby_box_horz_padding

var _w_pos = tby_game_width - tby_box_horz_padding*2

var _h_pos = tby_get_height_from_lines(_line_number)

return [_x_pos, _y_pos, _w_pos, _h_pos]