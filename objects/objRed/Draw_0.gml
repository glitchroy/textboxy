draw_self()

// Draws the info boxes

var cx, cy, cw, ch;
var cam = view_camera[0]
cx = camera_get_view_x(cam);
cy = camera_get_view_y(cam);
cw = camera_get_view_width(cam);
ch = camera_get_view_height(cam);

draw_set_color(c_black);
draw_set_alpha(0.75);
draw_rectangle(cx, cy,
			   cx+box1w+2,
			   cy+box1h+2,
			   false);

draw_rectangle(cx+480-box2w-2,
			   cy,
			   cx+480,
			   cy+box2h+2,
			   false);
				
draw_set_alpha(1);

draw_set_color(c_white);

scribble_draw(scrib1, cx+2, cy+2)
scribble_draw(scrib2, cx+480-box2w, cy+2);

if (global.tby_debug) {
	scribble_draw(scribd, cx+2, cy+4+box1h)
}