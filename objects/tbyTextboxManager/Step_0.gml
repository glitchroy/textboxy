if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		//speaker pos changed
		var w = tbyGetBoxWidth();
		var h = tbyGetBoxHeight();
		
		var speakerSprite = speaker.sprite_index;
		
		//top-left x/y
		var tlx = speaker.x - sprite_get_xoffset(speakerSprite);
		var tly = speaker.y - sprite_get_yoffset(speakerSprite);
		//middle x
		var middleX = tlx + sprite_get_width(speakerSprite)/2;
		
		var bubbleOffsetY = sprite_get_yoffset(tbyBubbleSprite);
		var bubbleHeight = sprite_get_height(tbyBubbleSprite);
		
		var newX = clamp(middleX - floor(w/2), 0, screenW-w);
		var newY = clamp(tly - h - bubbleHeight - tbyBoxBottomMargin,
						 0, screenH-h);
						 
		tbyUpdatePosition(newX, newY);
	}
}
#endregion