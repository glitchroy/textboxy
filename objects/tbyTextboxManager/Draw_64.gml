if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = tbyGetBoxWidth();
var h = tbyGetBoxHeight();

var boxX = clamp(tlx, 0, screenW-w);
var boxY = clamp(tly, 0, screenH-h);

tbyDrawBox(boxX, boxY, w, h);

var m = tbyBoxBottomMargin;
// Draw bubble sprite
if (tly >= 0 && tly < screenH-h-sprite_get_height(tbyBubbleSprite)-m) {
	if (ox >= tbyTileSize && ox <= screenW-tbyTileSize) {
		draw_sprite(tbyBubbleSprite, -1, ox, oy-m)
	}
}