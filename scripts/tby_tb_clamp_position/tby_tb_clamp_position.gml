// Called from textbox object only

var s/*:TbySize*/ = tbSize

var padding = tby_tile_size;
var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding);

sizeClamped = false;
//TODO: Figure this mess out
if (box[0]+padding < 0) { s[@TbySize.x] = 0; sizeClamped = true; }
if (box[1]+padding < 0) { s[@TbySize.y] = 0; sizeClamped = true; }
if (box[2]+padding+padding/2 > tby_game_width) { s[@TbySize.x] = tby_game_width - (box[2]-box[0]) - padding/2; sizeClamped = true; }
if (box[3]+padding+padding > tby_game_height) { s[@TbySize.y] = tby_game_height-(box[3]-box[1])-padding; sizeClamped = true; }