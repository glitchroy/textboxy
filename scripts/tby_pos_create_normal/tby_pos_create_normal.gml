/// @param yPos
/// @param lineNumber = tby_box_lines_per_tb
var yPos = argument[0];
var lineNumber = argument_count > 1 ? argument[1] : tby_box_lines_per_tb;

var xPos = tby_box_horz_padding

var wPos = tby_game_width - tby_box_horz_padding*2

var hPos = tby_pos_height_from_lines(lineNumber)

return [xPos, yPos, wPos, hPos]