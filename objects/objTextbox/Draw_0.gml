if (text == undefined) exit;

scribble_draw( text, x, y);

var box = scribble_get_box( text, x, y, 4, 4, 4, 4 );


draw_rectangle( box[0], box[1], box[2], box[3], true );

if (selected && finished) draw_circle(box[2]-8, box[3]-8, 4, false);

if (global.debug) {
    var ds;
    ds = string(id-100000) +
    "| Finished: " + stringBool(finished) +
    "| Selected: " + stringBool(selected);
	scribble_basic_draw_cached("sprFontSmall",
							   string_upper(ds),
							   box[0],
							   box[1]-10);
}