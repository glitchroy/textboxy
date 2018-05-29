if !running exit;

#region Speaker movement
// If speaker moves, update origin
if (instance_exists(speaker)) {
	if (speakerX != speaker.x || speakerY != speaker.y) {
		tbyCalculateSpeakerOffset();
		
		speakerX = speaker.x;
		speakerY = speaker.y;
	}
}
#endregion