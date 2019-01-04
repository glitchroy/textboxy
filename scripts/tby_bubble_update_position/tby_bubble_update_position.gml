/// @param inst
var inst = argument0;

// Called from textbox object only

var pos/*:TbyPos*/ = self.pos;
var padding = tby_tile_size;
//var box = scribble_get_box(textScribble, pos.x, pos.y, padding, padding, padding, padding); //box of textbox

//var offset = TbyBubble.calculate_offset(inst, box[2]-box[0], box[3]-box[1])
var offset = tby_bubble_calculate_offset(inst, pos[TbyPos.width], pos[TbyPos.height])

pos[@TbyPos.x] = offset[0]
pos[@TbyPos.y] = offset[1]
x = pos[TbyPos.x]
y = pos[TbyPos.y]