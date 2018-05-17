///@function tbyGetBoxWidth()
///@desc Returns the computated current width of the textbox, including the frame

with (tbyM()) {
	return min(currentWidth, maxWidth)+tbyTileSize*2;
}