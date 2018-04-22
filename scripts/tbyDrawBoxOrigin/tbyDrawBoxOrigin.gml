///@function tbyDrawBoxOrigin(ox, oy, width, height)
///@desc Draw a textbox centered and above an origin point while staying in bounds
///@param ox = 0
///@param oy = 0
///@param width = tileSize (min: tileSize)
///@param height = tileSize (min: tileSize)

var ox = argument0;
var oy = argument1;
var w = argument2;
var h = argument3;
var sh = sprite_get_height(tbyBubbleSprite) - sprite_get_yoffset(tbyBubbleSprite);

//top left corner
var topLeft = tbyOriginToTopLeft(ox, oy, w, h);

tbyDrawBox(topLeft[0], topLeft[1], w, h);

//only draw sprite if enough vertical space is there
if (oy > h+sh*2) {
	draw_sprite(tbyBubbleSprite, -1, ox, oy)
}