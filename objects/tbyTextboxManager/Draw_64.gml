if (!running) exit;
if (alarm[1] > 0) exit; //pause

tbyDrawBoxOrigin(ox, oy,
		//Add offset to box so inner area is exactly the size we want
		min(currentWidth, maxWidth)+tbyTileSize*2,
		min(lineHeight*currentLines, lineHeight*maxLines)+tbyTileSize*2);