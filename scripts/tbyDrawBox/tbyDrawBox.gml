///@function tbyDrawBox(x, y, width, height)
///@desc Draws a textbox with the specified parameters
///@param x = 0
///@param y = 0
///@param width = tileSize (min: tileSize/2)
///@param height = tileSize (min: tileSize/2)

#region Local Variables
var tx = 0;
var ty = 0;
var tw = tbyTileSize/2;
var th = tbyTileSize/2;

switch (argument_count) {
	case 4: th = max(tbyTileSize/2, argument[3]);
	case 3: tw = max(tbyTileSize/2, argument[2]);
	case 2: ty = argument[1];
	case 1: tx = argument[0];
			break;
}

var spr = tbyTextboxSprite;
var o = tbyTileSize;

var adjustedWidth  = max(o, tw - o*2); //width without corners
var adjustedHeight = max(o, th - o*2); //height without corners

var widthInPixels = (1/o)*(adjustedWidth);
var heightInPixels = (1/o)*(adjustedHeight);
#endregion

tbyDrawSprite(spr, TbySliceIndex.TopLeft,		tx,	ty)
tbyDrawSprite(spr, TbySliceIndex.TopMiddle,		tx+o, ty, widthInPixels);
tbyDrawSprite(spr, TbySliceIndex.TopRight,		tx+o+adjustedWidth, ty);

tbyDrawSprite(spr, TbySliceIndex.MiddleLeft,	tx, ty+o, 1, heightInPixels);
tbyDrawSprite(spr, TbySliceIndex.Middle,		tx+o, ty+o, widthInPixels, heightInPixels);
tbyDrawSprite(spr, TbySliceIndex.MiddleRight,	tx+o+adjustedWidth, ty+o, 1, heightInPixels);

tbyDrawSprite(spr, TbySliceIndex.BottomLeft,	tx, ty+o+adjustedHeight);
tbyDrawSprite(spr, TbySliceIndex.BottomMiddle,	tx+o, ty+o+adjustedHeight, widthInPixels);
tbyDrawSprite(spr, TbySliceIndex.BottomRight,	tx+o+adjustedWidth, ty+o+adjustedHeight);
