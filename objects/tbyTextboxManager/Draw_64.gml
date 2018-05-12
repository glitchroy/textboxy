if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = tbyGetBoxWidth();
var h = tbyGetBoxHeight();

var boxX = clamp(tlx, 0, screenW-w);
var boxY = clamp(tly, 0, screenH-h);

tbyDrawBox(boxX, boxY, w, h);

var m = tbyBoxBottomMargin;
var originX = tlx + w/2;
var originY = tly + h;

// Draw bubble sprite
if (speaker != noone) {
	if (tly >= 0 && tly < screenH-h-sprite_get_height(tbyBubbleSprite)-m) {
		if (originX >= tbyTileSize && originX <= screenW-tbyTileSize) {
			draw_sprite(tbyBubbleSprite, -1, originX, originY-m)
		}
	}
}