///@function tbyActionShowString(string)
///@desc This should not be called manually
///@param string

var s = argument0;
with (tbyM()) {
	//Strip control codes and store them for later use
	var cleanString = tbyStripControlCodes(s);
	
	//Returns string with proper line breaks
	var bs = tbySmartLineBreak(currentFont, maxWidth, cleanString)
	
	//Make string availiable to textboxManager
	currentMessage = bs;
	currentWidth = string_width(bs); //padding
	currentLines = string_count("\n", bs)+1;
	
	/*
	//if we have too many lines, we should
	//split the action in two actions
	if (currentLines > maxLines) {
		//TODO: Implement this, maybe while splitting
		//would be better for performance instead
		//of using SplitString again?
	}*/
	
	var tc = tbyOriginToTopLeft(
			 ox, oy,
			 min(currentWidth, maxWidth)+tbyTileSize*2,
			 min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);

	currentText = tbyT(bs, s, currentFont, tc[0], tc[1]);
}