if (!running) exit;
if (alarm[1] > 0) exit; //pause

var w = tbyGetBoxWidth();
var h = tbyGetBoxHeight();

tbyDrawBox(mx, my, w, h);

// Draw bubble sprite
if (tbyDrawBubbleSprite && speaker != noone) {
	var speakerSprite = speaker.sprite_index;
		
	//top-left x/y
	var tlx = speaker.x - sprite_get_xoffset(speakerSprite);
	var tly = speaker.y - sprite_get_yoffset(speakerSprite);
	var bubbleHeight = sprite_get_height(tbyBubbleSprite);
	
	//bubbleSprite x/y
	var bx = tlx + sprite_get_width(speakerSprite)/2;
	var by = tly-bubbleHeight-tbyBoxBottomMargin;
	
	//exit conditions
	if (tly-bubbleHeight < h) exit; //bubble sprite would be clipping into the box
	if (by > screenH) exit; //speaker is out of view
	if (bx < tbyTileSize) exit; //clips the left edge
	if (bx > screenW-tbyTileSize) exit; //clips the right edge
	
	//my + h is more reliable as y because it doesn't lag behind the msgbox
	draw_sprite(tbyBubbleSprite, -1, bx, my + h)
}