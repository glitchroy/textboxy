if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		//speaker pos changed
		var w = tbyGetBoxWidth();
		var h = tbyGetBoxHeight();
		
		ox = speaker.x;
		oy = speaker.y;
		tlx = ox - floor(w/2);
		tly = oy - h - floor(sprite_get_height(tbyBubbleSprite)/2) - tbyBoxBottomMargin;
		
		if (instance_exists(currentTextInstance)) {
			var tx = clamp(tlx, 0, screenW-w);
			var ty = clamp(tly, 0, screenH-h);
			
			with (currentTextInstance) {
				x = tx;
				y = ty;
			}
		}
	}
}
#endregion