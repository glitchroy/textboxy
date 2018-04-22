///@function tbyT(text, font, x, y)
///@desc Creates a new text instance with the given string
///@param text
///@param font
///@param x
///@param y

if (instance_exists(tbyTextObject)) {
	instance_destroy(tbyTextObject);
}

var t = tbyCreateTextSnippet;
var s = argument0;
var f = argument1;
var fx = argument2;
var fy = argument3;

with (t) {
	text = s;
	font = f;
	x = fx;
	y = fy;
	tbyTextStart;
}

return t;