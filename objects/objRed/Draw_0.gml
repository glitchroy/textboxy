draw_self()

// Draws the info boxes

var _cx, _cy, _cw, _ch;
var _cam = tby_game_camera
_cx = camera_get_view_x(_cam);
_cy = camera_get_view_y(_cam);
_cw = camera_get_view_width(_cam);
_ch = camera_get_view_height(_cam);

tby_draw_debug(_cx, _cy, debug_string)

if (global.tby_debug) {
	tby_draw_debug(_cx,
	               _cy+string_height(debug_string),
	               "DEBUG MODE ON")
}