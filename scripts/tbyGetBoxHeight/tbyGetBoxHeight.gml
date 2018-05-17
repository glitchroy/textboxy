///@function tbyGetBoxHeight()
///@desc Returns the computated current height of the textbox, including the frame


with (tbyM()) {
	return min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2;
}