/// @param xPos = tby_game_width/2
/// @param yPos = tby_game_height/2
/// @param width = tby_game_width+1
/// @param height = tby_game_height+1
/// @param margin = 0
//args xPos = tby_game_width/2, yPos = tby_game_height/2, width = tby_game_width+1, height = tby_game_height+1, margin = 0
var xPos = argument_count > 0 ? argument[0] : tby_game_width/2;
var yPos = argument_count > 1 ? argument[1] : tby_game_height/2;
var width = argument_count > 2 ? argument[2] : tby_game_width+1;
var height = argument_count > 3 ? argument[3] : tby_game_height+1;
var margin = argument_count > 4 ? argument[4] : 0;

return [xPos+margin, yPos+margin, width-margin*2, height-margin*2]