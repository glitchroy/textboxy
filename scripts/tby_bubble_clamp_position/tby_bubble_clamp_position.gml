/// @desc Returns the position of a TbyType.Bubble textbox, clamped to the screen view.
// Called from textbox object only

var pos/*:TbyPos*/ = self.pos;
var padding = tby_tile_size;
var box = scribble_get_box(textScribble, pos[TbyPos.x], pos[TbyPos.y], padding, padding, padding, padding); //box of textbox

sizeClamped = false;

var cx, cy, cw, ch;
var cam = view_camera[0]

if (cam != -1) {
    // cam vars
    cx = camera_get_view_x(cam);
    cy = camera_get_view_y(cam);
    cw = camera_get_view_width(cam);
    ch = camera_get_view_height(cam);
} else {
    // room vars if no cam was found
    cx = 0;
    cy = 0;
    cw = tby_game_width;
    ch = tby_game_height;
}

if (box[0] < cx) { pos[@TbyPos.x] = cx+padding; sizeClamped = true; }
if (box[1] < cy) { pos[@TbyPos.y] = cy+padding; sizeClamped = true; }
if (box[2] > cx+cw)  { pos[@TbyPos.x] = cx+cw  - (box[2]-box[0]-padding); sizeClamped = true; }
if (box[3] > cy+ch) { pos[@TbyPos.y] = cy+ch - (box[3]-box[1]-padding); sizeClamped = true; }