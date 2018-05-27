///@function tbyActionSetSpeaker(speaker)
///@desc This should not be called manually
///@param speaker

var m = tbyM();
m.speaker = argument0;

//Also set origin and x,y
if (instance_exists(speaker)) {
	m.speakerX = speaker.x;
	m.speakerY = speaker.y;
	
	// ORIGIN
	//top-left x/y
	var speakerSprite = speaker.sprite_index;
	var tlx = speaker.x - sprite_get_xoffset(speakerSprite);
	var tly = speaker.y - sprite_get_yoffset(speakerSprite);
	//middle x
	var middleX = tlx + sprite_get_width(speakerSprite)/2;
	
	var sx = middleX;
	//the bubble sprite height gets applied in the positionUpdate
	var sy = tly - tbyBoxBottomMargin;
	
	m.positionUpdate = [TbyPositionUpdateType.Origin, sx, sy]
	
}