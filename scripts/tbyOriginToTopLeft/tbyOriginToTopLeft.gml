///@function tbyOriginToTopLeft(ox, oy, width, height);
///@desc Returns array of top left corner from a textbox with origin on bottom middle
///@param ox
///@param oy
///@param width = tileSize (min: tileSize)
///@param height = tileSize (min: tileSize)

var dw = display_get_gui_width();
var dh = display_get_gui_height();
var sw = sprite_get_width(tbyBubbleSprite) - sprite_get_xoffset(tbyBubbleSprite);
var sh = sprite_get_height(tbyBubbleSprite) - sprite_get_yoffset(tbyBubbleSprite);

var w = argument2;
var h = argument3;
var ox = clamp(argument0, tbyTileSize+sw, dw-sw-tbyTileSize);
var oy = clamp(argument1, tbyTileSize+sh, dh-sh-tbyTileSize);

//top left corner
var tx = clamp(ox - w/2,
			   0, dw-w);
var ty = clamp(oy - h - sprite_get_height(tbyBubbleSprite) + tbyTileSize,
			   0, dh);
			   
return [tx, ty]