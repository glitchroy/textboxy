if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		//speaker pos changed
		speakerX = speaker.x;
		speakerY = speaker.y;
		tbyActionSetOrigin(speakerX, speakerY);
		
		if (instance_exists(currentText)) {
			var tc = tbyOriginToTopLeft(
					 ox, oy,
					 min(currentWidth, maxWidth)+tbyTileSize*2,
					 min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);

			with (currentText) {
				x = tc[0];
				y = tc[1];
			}
		}
	}
}
#endregion