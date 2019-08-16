/// @desc Returns the position of a TbyType.Bubble textbox, clamped to the screen view.
// Called from textbox object only

var _pos/*:TbyPos*/ = self.pos;
var _padding = tby_tile_size;
var _box = scribble_get_box(text_scribble, _pos[TbyPos.x], _pos[TbyPos.y], _padding, _padding, _padding, _padding); //box of textbox

size_clamped = false;

var _cx, _cy, _cw, _ch;
var _cam = view_camera[0]

if (_cam != -1) {
    // cam vars
    _cx = camera_get_view_x(_cam);
    _cy = camera_get_view_y(_cam);
    _cw = camera_get_view_width(_cam);
    _ch = camera_get_view_height(_cam);
} else {
    // room vars if no cam was found
    _cx = 0;
    _cy = 0;
    _cw = tby_game_width;
    _ch = tby_game_height;
}

if (_box[0] < _cx) { _pos[@TbyPos.x] = _cx+_padding; size_clamped = true; }
if (_box[1] < _cy) { _pos[@TbyPos.y] = _cy+_padding; size_clamped = true; }
if (_box[2] > _cx+_cw)  { _pos[@TbyPos.x] = _cx+_cw  - (_box[2]-_box[0]-_padding); size_clamped = true; }
if (_box[3] > _cy+_ch) { _pos[@TbyPos.y] = _cy+_ch - (_box[3]-_box[1]-_padding); size_clamped = true; }