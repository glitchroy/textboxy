///@function tbyActionShowString(string)
///@desc This should not be called manually
///@param string
var s = string_replace_all(argument0, "\r\n", "\n")
var l = tbyDivideStringToChunks(s);

draw_set_font(tbyDefaultFont);

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

var cleanString = "";
var dirtyString = "";
for (var j = 0; j < ds_list_size(l); j++) {
	var c = ds_list_find_value(l, j);
	
	dirtyString += string(c);
	
	// Skip control codes
	if (string_char_at(c, 1) != tbyControlCodeOpening) {
		cleanString += string(c);
		//error(string_width(cleanString), cleanString)
	}
}

if (ds_exists(l, ds_type_list)) {
	ds_list_destroy(l);
}

#region Set up text instance
currentWidth = string_width(cleanString);
currentLines = string_count("\n", cleanString)+1;

with (tbyM()) {
	var tc = tbyOriginToTopLeft(
				ox, oy,
				min(currentWidth, maxWidth)+tbyTileSize*2,
				min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);

	currentText = tbyT(cleanString, dirtyString, currentFont, tc[0], tc[1],
						currentWidth, currentLines*tbyLineHeight,
						standardWait)
}
#endregion