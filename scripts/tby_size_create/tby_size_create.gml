/// @param xPos = gameWidth/2
/// @param yPos = gameHeight/2
/// @param width = gameWidth+1
/// @param height = gameHeight+1
/// @param margin = 0
//args xPos = gameWidth/2, yPos = gameHeight/2, width = gameWidth+1, height = gameHeight+1, margin = 0
var xPos = argument_count > 0 ? argument[0] : gameWidth/2;
var yPos = argument_count > 1 ? argument[1] : gameHeight/2;
var width = argument_count > 2 ? argument[2] : gameWidth+1;
var height = argument_count > 3 ? argument[3] : gameHeight+1;
var margin = argument_count > 4 ? argument[4] : 0;

return [xPos+margin, yPos+margin, width-margin*2, height-margin*2]