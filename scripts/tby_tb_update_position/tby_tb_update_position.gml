/// @param inst
var inst = argument0;

// Called from textbox object only

var s/*:TbySize*/ = textSize//box of text
var padding = tby_tile_size;
var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding); //box of textbox

//calc top middle
var ix = inst.x - sprite_get_xoffset(inst.sprite_index) + sprite_get_width(inst.sprite_index)
var iy = inst.y - sprite_get_yoffset(inst.sprite_index)

var offsetWidth  = (box[2]-box[0]) / 2
var bubbleHeight = sprite_get_height(tby_array_get(tby_default_skin, TbySkin.Bubble))
var offsetHeight = (box[3]-box[1]) + bubbleHeight

s[@TbySize.x] = floor(ix - offsetWidth);
s[@TbySize.y] = floor(iy - offsetHeight);
x = s[TbySize.x]
y = s[TbySize.y]