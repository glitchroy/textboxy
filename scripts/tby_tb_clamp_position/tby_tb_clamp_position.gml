// Called from textbox object only

var s/*:TbySize*/ = textSize//box of text
var padding = tby_tile_size;
var box = scribble_get_box(text, s[TbySize.x], s[TbySize.y], padding, padding, padding, padding); //box of textbox

sizeClamped = false;
if (box[0] < 0) { s[@TbySize.x] = padding; sizeClamped = true; }
if (box[1] < 0) { s[@TbySize.y] = padding; sizeClamped = true; }
if (box[2] > tby_game_width)  { s[@TbySize.x] = tby_game_width  - (box[2]-box[0]-padding); sizeClamped = true; }
if (box[3] > tby_game_height) { s[@TbySize.y] = tby_game_height - (box[3]-box[1]-padding); sizeClamped = true; }