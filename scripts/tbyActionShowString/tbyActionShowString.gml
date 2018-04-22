///@function tbyActionShowString(string)
///@desc This should not be called manually
///@param string

var s = string_replace_all(argument0, "\r\n", "\n");
with (tbyM()) {
	//Strip control codes and store them for later use
	var cleanString = tbyStripControlCodes(s);
	
	//Returns string with proper line breaks
	var bs = tbySmartLineBreak(currentFont, maxWidth, cleanString)
	
	//Make vars availiable to textboxManager
	currentWidth = string_width(bs);
	currentLines = string_count("\n", bs)+1;
	//Add one tile to width if only one line
	if (tbyDrawPauseSymbol && currentLines == 1) currentWidth += tbyTileSize;
	
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

	currentText = tbyT(bs, s, currentFont, tc[0], tc[1],
					   currentWidth, currentLines*tbyLineHeight,
					   standardWait)
}