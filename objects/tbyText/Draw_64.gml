if !running exit;

var dx = x+tbyTileSize;
var dy = y+tbyTileSize;
var offx = 0;
var offy = 0;
for (var i = 1; i <= string_length(typewriterText); i++) {
	draw_set_font(font);
	var c = string_char_at(typewriterText, i);
	var jx = 0;
	var jy = 0;
	
	currentColor = ccGrid[# i-1, TbyCode.Color];
	if (currentColor == undefined) currentColor = tbyDefaultColor;
	currentJitter = ccGrid[# i-1, TbyCode.Jittery];
	if (currentJitter == undefined) currentJitter = false;
	//currentFont = ccGrid[# i-1, TbyCode.Font];
	
	draw_set_color(currentColor);
	
	if (currentJitter) {
		jx = choose(-1, 1, 0, 0, 0, 0, 0, 0, 0);
		jy = choose(-1, 1, 0, 0, 0, 0, 0, 0, 0);
	}
	
	draw_text(dx+offx+jx, dy+offy+jy, c);
	
	if (c = "\n") {
		offx = 0;
		offy += lineHeight;
	} else {
		offx += string_width(c);
	}
}

if (tbyDrawPauseSprite && finished) {
	var fx = x+width;
	var fy = y+height;
	draw_sprite(tbyPauseSprite, -1, fx, fy);
}
