if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		//speaker pos changed
		var w = tbyGetBoxWidth();
		var h = tbyGetBoxHeight();
		
		var speakerSprite = speaker.sprite_index;
		var spriteHalf = sprite_get_xoffset(speakerSprite) + (sprite_get_width(speakerSprite)/2)
		
		var newX = clamp(speaker.x - floor(w/2) + spriteHalf, 0, screenW-w);
		var newY = clamp(speaker.y - h - floor(sprite_get_yoffset(tbyBubbleSprite)) - tbyBoxBottomMargin,
						 0, screenH-h);
						 
		tbyUpdatePosition(newX, newY);
	}
}
#endregion