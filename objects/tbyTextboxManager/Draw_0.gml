if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = tbyGetBoxWidth();
var h = tbyGetBoxHeight();

tbyDrawBox(mx, my, w, h);

// Draw bubble sprite
if (tbyDrawBubbleSprite && speaker != noone) {
	var ts = tbyTileSize;
	var spr = speaker.sprite_index;
	var sx = speaker.x - sprite_get_xoffset(spr) + (sprite_get_width(spr)/2);
	var sy = speaker.y;
	var m = tbyBoxBottomMargin;
	var soff = floor(sprite_get_yoffset(tbyBubbleSprite));
	
	if (sx > ts && sx < screenW-ts) { //Origin is in x bounds
		if (sy > h+soff+m && sy < screenH-soff+m) { //Origin is in y bounds
			draw_sprite(tbyBubbleSprite, -1, sx, sy-soff-m)
		}
	}
}