if (text == undefined) exit;

var box = scribble_get_box( text, x, y, 4, 4, 4, 4 );

draw_set_color(c_black);
draw_rectangle( box[0], box[1], box[2], box[3], false);

scribble_draw( text, x, y);

draw_set_color(c_white);
if (selected && finished) draw_circle(box[2]-8, box[3]-8, 4, false);

if (selectable && !selected) {
	//inactive
	draw_set_color(c_black);
	draw_set_alpha(0.65);
	draw_rectangle( box[0], box[1], box[2], box[3], false );
	draw_set_alpha(1);
}

draw_set_color(c_white);
draw_rectangle( box[0], box[1], box[2], box[3], true );

if (global.debug) {
    var ds;
    ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    "| Finished: " + stringBool(finished) +
    "| Selected: " + stringBool(selected);
	scribble_basic_draw_cached("sprFontSmall",
							   string_upper(ds),
							   box[0],
							   box[1]-10);
}