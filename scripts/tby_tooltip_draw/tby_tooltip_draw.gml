/// @param _tooltip_name
/// @param _tx
/// @param _ty
var _tooltip_name = argument0, _tx = argument1, _ty = argument2;

var _text = tby_tooltip_get_text(_tooltip_name);
var _box = scribble_get_box(_text, 0, 0); // just for relative width / height

var _tw = tby_scribble_get_box_width(_box)
var _th = tby_scribble_get_box_height(_box)
var _coordinates = tby_tooltip_calculate_offset(_tx, _ty, _tw, _th)

var _padding = tby_tile_size;
var _pos/*:TbyPos*/ = [_coordinates[0], _coordinates[1], _tw, _th]

var _box_dim = [_pos[TbyPos.x]-_padding,
                _pos[TbyPos.y]-_padding,
				_pos[TbyPos.x]+_pos[TbyPos.width]+_padding,
				_pos[TbyPos.y]+_pos[TbyPos.height]+_padding
				]

tby_draw_box(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3]);
scribble_draw(_text, _pos[TbyPos.x]-1, _pos[TbyPos.y]-1);

//Bubble
if (tby_tooltip_get_draw_bubble_sprite(_tooltip_name)) {
    var _bubble_sprite = tby_array_get(tby_default_skin, TbySkin.Bubble)
    tby_draw_sprite(_bubble_sprite,
	                _box_dim[0]+(_box_dim[2]-_box_dim[0])/2,
					_pos[TbyPos.y]+_pos[TbyPos.height]+_padding)
}