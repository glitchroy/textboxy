if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		//speaker pos changed
		var w = min(currentWidth, maxWidth)+tbyTileSize*2;
		var h = min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2;
		
		ox = speaker.x;
		oy = speaker.y;
		tlx = ox - floor(w/2);
		tly = oy - h - floor(sprite_get_height(tbyBubbleSprite)/2);
		
		if (instance_exists(currentTextInstance)) {
			var tx = clamp(tlx, 0, screenW-currentWidth);
			var ty = clamp(tly, 0, screenH-currentLines*lineHeight);
			
			with (currentTextInstance) {
				x = tx;
				y = ty;
			}
		}
	}
}
#endregion