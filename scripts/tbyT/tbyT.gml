///@function tbyT(text, dirtyText, font, x, y)
///@desc Creates a new text instance with the given string
///@param text string without control codes
///@param dirtyText string with control codes
///@param font
///@param x
///@param y

if (instance_exists(tbyTextObject)) {
	instance_destroy(tbyTextObject);
}

var t = tbyCreateTextSnippet;
var s = argument0;
var ds = argument1;
var f = argument2;
var fx = argument3;
var fy = argument4;

with (t) {
	cleanText = s;
	dirtyText = ds;
	font = f;
	x = fx;
	y = fy;
	tbyTextStart;
}

return t;