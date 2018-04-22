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
	var spr = speaker.sprite_index;
	//middle
	var sx = speaker.x - sprite_get_xoffset(spr) + (sprite_get_width(spr)/2)
	//top
	var sy = speaker.y - sprite_get_yoffset(spr)
	
	tbyActionSetOrigin(sx, sy);
}