if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = min(currentWidth, maxWidth);
var h = min(lineHeight*currentLines, lineHeight*maxLines);

var boxX = clamp(tlx, 0, screenW-w);
var boxY = clamp(tly, 0, screenH-h);

tbyDrawBox(boxX, boxY, w+tbyTileSize*2, h+tbyTileSize*2);

// Draw bubble sprite
if (tly >= 0 && tly < screenH-h-tbyTileSize*2-sprite_get_height(tbyBubbleSprite)) {
	if (ox >= tbyTileSize && ox <= screenW-tbyTileSize) {
		draw_sprite(tbyBubbleSprite, -1, ox, oy)
	}
}