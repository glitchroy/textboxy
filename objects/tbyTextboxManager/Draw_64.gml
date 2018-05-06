if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = min(currentWidth, maxWidth);
var h = min(lineHeight*currentLines, lineHeight*maxLines);

var boxX = clamp(tlx, 0, screenW-w);
var boxY = clamp(tly, 0, screenH-h);

tbyDrawBox(boxX, boxY, w+tbyTileSize*2, h+tbyTileSize*2);

if (tly >= 0 && tly < screenH-h-tbyTileSize*2-sprite_get_height(tbyBubbleSprite)) {
	draw_sprite(tbyBubbleSprite, -1, ox, oy)
}
/*
tbyDrawBoxOrigin(ox, oy,
		//Add offset to box so inner area is exactly the size we want
		min(currentWidth, maxWidth)+tbyTileSize*2,
		min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);