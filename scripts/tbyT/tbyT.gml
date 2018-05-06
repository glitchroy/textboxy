///@function tbyT(text, dirtyText, font, x, y, w, h, wait, line)
///@desc Creates a new text instance with the given string
///@param text string without control codes
///@param dirtyText string with control codes
///@param font
///@param x
///@param y
///@param w
///@param h
///@param wait

if (instance_exists(tbyTextObject)) {
	instance_destroy(tbyTextObject);
}

var t = tbyCreateTextSnippet;
var s = argument0;
var ds = argument1;
var f = argument2;
var fx = argument3;
var fy = argument4;
var fw = argument5;
var fh = argument6;
var waitTime = argument7;

with (t) {
	cleanText = s;
	dirtyText = ds;
	font = f;
	x = fx;
	y = fy;
	width = fw;
	height = fh;
	
	wait = waitTime;
	
	draw_set_font(font);
	lineHeight = string_height(ord("W"));
	
	tbyTextStart;
}

return t;