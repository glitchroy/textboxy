draw_self()

// Draws the info boxes

var cx, cy, cw, ch;
var cam = view_camera[0]
cx = camera_get_view_x(cam);
cy = camera_get_view_y(cam);
cw = camera_get_view_width(cam);
ch = camera_get_view_height(cam);

tby_draw_debug(cx, cy, debug_string)

if (global.tby_debug) {
	tby_draw_debug(cx,
	               cy+string_height(debug_string),
	               "DEBUG MODE ON")
}