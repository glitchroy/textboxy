/// @param inst
var inst = argument0;

// Called from textbox object only

var s/*:TbySize*/ = tbSize

var padding = tby_tile_size;
var heightOffset = s[TbySize.height] + padding
var widthOffset = s[TbySize.width] + padding*2
var bubble = sprite_get_height(tby_array_get(tby_default_skin, TbySkin.Bubble))

//Calculate y offset if auto-sizes
if (s[TbySize.width] > tby_game_width || s[TbySize.height] > tby_game_height) {
    var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding);
    
    if (s[TbySize.width]  > tby_game_width)  widthOffset  = box[2]-box[0]
    if (s[TbySize.height] > tby_game_height) heightOffset = box[3]-box[1]
}

var ix = inst.x - sprite_get_xoffset(inst.sprite_index) + sprite_get_width(inst.sprite_index)/2
var iy = inst.y - sprite_get_yoffset(inst.sprite_index)

s[@TbySize.x] = ix - widthOffset/2;
s[@TbySize.y] = iy - heightOffset - bubble - padding;
x = s[TbySize.x]
y = s[TbySize.y]