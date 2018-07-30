/// @param xPos = gameWidth/2
/// @param yPos = gameHeight/2
/// @param ?width = undefined
/// @param ?height = undefined
/// @param margin = 10
//args xPos = gameWidth/2, yPos = gameHeight/2, ?width, ?height, margin = 10
var xPos = argument_count > 0 ? argument[0] : gameWidth/2;
var yPos = argument_count > 1 ? argument[1] : gameHeight/2;
var width = argument_count > 2 ? argument[2] : undefined;
var height = argument_count > 3 ? argument[3] : undefined;
var margin = argument_count > 4 ? argument[4] : 10;

return [xPos+margin, yPos+margin, is_undefined(width) ? width : width-margin, is_undefined(height) ? height : height-margin]