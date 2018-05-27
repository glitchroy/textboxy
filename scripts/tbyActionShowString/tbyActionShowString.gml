///@function tbyActionShowString(string)
///@desc This should not be called manually
///@param string
var s = string_replace_all(argument0, "\r\n", "\n")
var l = tbyDivideStringToChunks(s);

draw_set_font(currentFont);

#region Insert smart line breaks
var stringBuilder = "";
for (var i = 0; i < ds_list_size(l); i++) {
	var e = ds_list_find_value(l, i);
	// Skip control codes
	if (string_length(e) > 1
		&& string_char_at(e, 1) == tbyControlCodeOpening) {
		continue;
	}
	
	// Reset the building string if we encounter a line break
	if (e == "\n") {
		stringBuilder = "";
		continue;
	}
	
	stringBuilder += string(e);
	
	// Check for max width line break insertion
	if (string_width(stringBuilder) > maxWidth) {
		tbyFindLineBreakPosition(l, i);
		i++;
		stringBuilder = "";
		continue;
	}
}
#endregion

//TODO: Make string building more efficient
/* What we are doing here is basically
splitting the string up, inserting line
breaks and putting it back together, only
to split it up again later for the control
code parsing. This is inefficient and could
be combined into a single step somehow. */

var cleanString = "";
var dirtyString = "";
for (var j = 0; j < ds_list_size(l); j++) {
	var c = ds_list_find_value(l, j);
	
	dirtyString += string(c);
	
	// Skip control codes
	if (string_char_at(c, 1) != tbyControlCodeOpening) {
		cleanString += string(c);
	}
}

if (ds_exists(l, ds_type_list)) {
	ds_list_destroy(l);
}

#region Set up text instance
currentWidth = string_width(cleanString);
currentLines = string_count("\n", cleanString)+1;

#region Apply position update
if (is_array(positionUpdate)) {
	var w = tbyGetBoxWidth();
	var h = tbyGetBoxHeight();
	var type = positionUpdate[TbyPositionUpdate.Type];
	
	var topLeftCoords = [ positionUpdate[TbyPositionUpdate.X],
						  positionUpdate[TbyPositionUpdate.Y] ]
	
	switch (type) {
		case TbyPositionUpdateType.TopLeft:
			// Nothing
		break;
		case TbyPositionUpdateType.Origin:
			topLeftCoords[0] -= floor(w/2);
			topLeftCoords[1] -= h;
		break;
	}
	positionUpdate = undefined;
	
	// This will shift the position up to account for the
	// bubble sprite, but only if it is shown
	if (type != TbyPositionUpdateType.TopLeft) {
		if (speaker != noone) {
			topLeftCoords[1] -= sprite_get_height(tbyBubbleSprite)
		}
	}
	
	tbyUpdatePosition(topLeftCoords);
}
#endregion

// Callback
if (script_exists(tbyCbOnMessageStart)) {
	script_execute(tbyCbOnMessageStart, speaker, cleanString);
}

with (tbyM()) {
	currentTextInstance = tbyT(cleanString, dirtyString, currentFont,
						mx, my,
						tbyGetBoxWidth(), tbyGetBoxHeight(),
						standardWait, sound)
}
#endregion