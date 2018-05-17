///@function tbyDrawSprite(sprite, subimg, x, y, xscale, yscale)
///@desc variation of draw_sprite_ext without rotation, blending or alpha
///@param sprite
///@param subimg
///@param x
///@param y
///@param xscale
///@param yscale

#region Local Variables
var xs = 1;
var ys = 1;

switch (argument_count) {
	case 6: ys = argument[5];
	case 5: xs = argument[4];
			break;
}
#endregion

draw_sprite_ext(argument[0], argument[1],
				argument[2], argument[3],
				xs, ys,
				0, c_white, 1)