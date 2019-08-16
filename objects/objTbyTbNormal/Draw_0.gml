if (state_name == "Init" || state_name == "Vanishing") exit;
if (text_scribble == undefined) exit;

// Define variables to work with
var _padding = tby_tile_size;
var _text_dim/*:TbyPos*/ = tby_array_clone(pos)
var _box_dim = [_text_dim[TbyPos.x]-_padding, _text_dim[TbyPos.y]-_padding, _text_dim[TbyPos.x]+_text_dim[TbyPos.width]+_padding, _text_dim[TbyPos.y]+_text_dim[TbyPos.height]+_padding]

// Background
tby_draw_box(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3]);

scribble_draw(text_scribble, _text_dim[TbyPos.x]-1, _text_dim[TbyPos.y]-1);

// Finished circle
var _circle_sprite = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Pause)
if (state_name == "Finished") draw_sprite(_circle_sprite, -1, _text_dim[TbyPos.x]+_text_dim[TbyPos.width]+_padding,
                                                           _text_dim[TbyPos.y]+_text_dim[TbyPos.height]+_padding)

#region Debug
if (global.tby_debug) {
    draw_set_alpha(0.75)
    draw_set_color(c_green); draw_rectangle(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3], true); //outer
    draw_set_color(c_aqua);  draw_rectangle(_text_dim[TbyPos.x], _text_dim[TbyPos.y], _text_dim[TbyPos.x]+_text_dim[TbyPos.width], _text_dim[TbyPos.y]+_text_dim[TbyPos.height], true); //inner
    draw_set_alpha(1)

    var _ds;
    _ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    " | State: " + state_name +
	" | " + string(text_scribble[| __SCRIBBLE.TW_SPEED]) +
	" | " + string(text_scribble[| __SCRIBBLE.TW_POSITION]);
    
    tby_draw_debug(_box_dim[0], _box_dim[1]-_padding-5, _ds);
}
#endregion