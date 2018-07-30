if (text == undefined) exit;
var margin = 4;
var box = scribble_get_box( text, x, y, margin, margin, margin, margin );

var s;
if (is_array(size)) {
    var bsize/*:TBSize*/ = size;
    s = [x, y, x+bsize[TBSize.width], y+bsize[TBSize.height]]
} else {
    s = box;
}

// Background
draw_set_color(c_black);
draw_rectangle( s[0], s[1], s[2], s[3], false);

scribble_draw( text, s[0]+margin, s[1]+margin);

// Finished circle
draw_set_color(c_white);
if (selected && finished) draw_circle(s[2]-8, s[3]-8, 4, false);

if (selectable && !selected) {
	//inactive
	draw_set_color(c_black);
	draw_set_alpha(0.65);
	draw_rectangle( s[0], s[1], s[2], s[3], false );
	draw_set_alpha(1);
}

// Border
draw_set_color(c_white);
draw_rectangle( s[0], s[1], s[2], s[3], true );

if (global.debug) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| Finished: " + stringBool(finished) +
    "| Selected: " + stringBool(selected);
	scribble_basic_draw_cached("sprFontSmall",
							   string_upper(ds),
							   s[0],
							   s[1]-10);
}