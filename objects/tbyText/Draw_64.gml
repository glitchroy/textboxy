if !running exit;

var dx = x+tbyTileSize;
var dy = y+tbyTileSize;
var offx = 0;
var offy = 0;
for (var i = 1; i <= string_length(typewriterText); i++) {
	var c = string_char_at(typewriterText, i);
	var jx = 0;
	var jy = 0;
	
	currentColor = ccGrid[# i-1, TbyControlCode.Color];
	if (currentColor == undefined) currentColor = tbyTranslateColor(0);
	currentJitter = ccGrid[# i-1, TbyControlCode.Jittery];
	if (currentJitter == undefined) currentJitter = false;
	//currentFont = ccGrid[# i-1, TbyControlCode.Font];
	
	draw_set_color(currentColor);
	draw_set_font(font);
	
	if (currentJitter) {
		jx = choose(-1, 1, 0, 0, 0, 0, 0);
		jy = choose(-1, 1, 0, 0, 0, 0, 0);
	}
	
	draw_text(dx+offx+jx, dy+offy+jy, c);
	
	if (c = "\n") {
		offx = 0;
		offy += tbyDefaultLineHeight;
	} else {
		offx += string_width(c);
	}
}