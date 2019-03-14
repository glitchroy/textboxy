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
			   cx+tby_scribble_get_box_width(box1)+2,
			   cy+tby_scribble_get_box_height(box1)+2,
			   false);

draw_rectangle(cx+480-tby_scribble_get_box_width(box2)-2,
			   cy,
			   cx+480,
			   cy+tby_scribble_get_box_height(box2)+2,
			   false);
				
draw_set_alpha(1);

draw_set_color(c_white);

scribble_draw(scrib1, cx+2, cy+2)
scribble_draw(scrib2, cx+480-tby_scribble_get_box_width(box2), cy+2);

if (global.tby_debug) {
	scribble_draw(scribd, cx+2, cy+4+tby_scribble_get_box_height(box1))
}