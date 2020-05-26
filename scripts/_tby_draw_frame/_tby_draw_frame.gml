/// @desc Draws a textboxy textbox, given the top left and bottom right corner. Uses the current active skin.
/// @param _x1
/// @param _y1
/// @param _x2
/// @param _y2
/// @param _size
/// @param _sprite = _tby_array_get(tby_default_skin, TbySkin.Frame)
function _tby_draw_frame() {
	var _x1 = argument[0], _y1 = argument[1], _x2 = argument[2], _y2 = argument[3], _size = argument[4];
	var _sprite = argument_count > 5 ? argument[5] : _tby_array_get(tby_default_skin, TbySkin.Frame);
	var _width  = (_x2 - _x1) / _size;
	var _height = (_y2 - _y1) / _size;

	// One tile scale unit
	var _u = 2;

	// Middle
	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*1 tby_draw_sprite_part_mf2 _size*1 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1+_size tby_draw_sprite_part_mf6 _y1+_size tby_draw_sprite_part_mf7 _width-_u tby_draw_sprite_part_mf8 _height-_u tby_draw_sprite_part_mf9;
	//RowTop
	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*1 tby_draw_sprite_part_mf2 0 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1+_size tby_draw_sprite_part_mf6 _y1 tby_draw_sprite_part_mf7 _width-_u tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;
	//RowLeft
	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 0 tby_draw_sprite_part_mf2 _size*1 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1 tby_draw_sprite_part_mf6 _y1+_size tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 _height-_u tby_draw_sprite_part_mf9;
	//RowRight
	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*2 tby_draw_sprite_part_mf2 _size*1 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x2-_size tby_draw_sprite_part_mf6 _y1+_size tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 _height-_u tby_draw_sprite_part_mf9;
	//RowBottom
	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*1 tby_draw_sprite_part_mf2 _size*2 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1+_size tby_draw_sprite_part_mf6 _y2-_size tby_draw_sprite_part_mf7 _width-_u tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;
	//TopLeft

	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 0 tby_draw_sprite_part_mf2 0 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1 tby_draw_sprite_part_mf6 _y1 tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;
	//TopRight

	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*2 tby_draw_sprite_part_mf2 0 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x2-_size tby_draw_sprite_part_mf6 _y1 tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;
	//BottomLeft

	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 0 tby_draw_sprite_part_mf2 _size*2 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x1 tby_draw_sprite_part_mf6 _y2-_size tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;
	//BottomRight

	tby_draw_sprite_part_mf0 _sprite tby_draw_sprite_part_mf1 _size*2 tby_draw_sprite_part_mf2 _size*2 tby_draw_sprite_part_mf3 _size tby_draw_sprite_part_mf4 _size tby_draw_sprite_part_mf5 _x2-_size tby_draw_sprite_part_mf6 _y2-_size tby_draw_sprite_part_mf7 1 tby_draw_sprite_part_mf8 1 tby_draw_sprite_part_mf9;


}
