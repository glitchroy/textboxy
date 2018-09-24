/// @param xPos = game_width/2
/// @param yPos = game_height/2
/// @param width = game_width+1
/// @param height = game_height+1
/// @param margin = 0
//args xPos = game_width/2, yPos = game_height/2, width = game_width+1, height = game_height+1, margin = 0
var xPos = argument_count > 0 ? argument[0] : game_width/2;
var yPos = argument_count > 1 ? argument[1] : game_height/2;
var width = argument_count > 2 ? argument[2] : game_width+1;
var height = argument_count > 3 ? argument[3] : game_height+1;
var margin = argument_count > 4 ? argument[4] : 0;

return [xPos+margin, yPos+margin, width-margin*2, height-margin*2]