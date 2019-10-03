if (scribble == undefined) exit;

var _skin/*:TbySkin*/ = skin;
var _dim/*:TbyDim*/ = dimensions;

tby_draw_frame(_dim[TbyDim.x1], _dim[TbyDim.y1], _dim[TbyDim.x2], _dim[TbyDim.y2], _skin[TbySkin.TileSize], _skin[TbySkin.Frame]);
scribble_draw(scribble, _dim[TbyDim.x_content], _dim[TbyDim.y_content]);

#region Input circle
if (draw_input_circle) draw_sprite(_skin[TbySkin.Pause], -1, _dim[TbyDim.x2], _dim[TbyDim.y2]);
#endregion

#region Bubble sprite
if (draw_bubble_sprite) {
    draw_sprite(
        _skin[TbySkin.Bubble], -1,
        lerp(_dim[TbyDim.x1], _dim[TbyDim.x2], 0.5),
        _dim[TbyDim.y2],
        );
}
#endregion

#region Choice type
if (type == TbyType.Choice && state_name == "Finished") {
    var _height_offset = tby_dim_line_height(choice_first_line + choice_selected + 1);
    
    draw_sprite(_skin[TbySkin.Arrow], -1,
                _dim[TbyDim.x_content] + 3,
                _dim[TbyDim.y_content] + _height_offset + 1);
}
#endregion

//////////////////////////

#region Debug
if (global.tby_debug) {
    var _dim/*:TbyDim*/ = dimensions;
    
    draw_set_alpha(0.75);
    draw_set_color(c_green);
    draw_rectangle(_dim[TbyDim.x1], _dim[TbyDim.y1], _dim[TbyDim.x2], _dim[TbyDim.y2], true);
    draw_set_alpha(0.5);
    draw_set_color(c_aqua);
    draw_circle(_dim[TbyDim.x_content], _dim[TbyDim.y_content], 1, false);
    draw_set_alpha(1);

    var _ds;
    _ds = string(id-100000) +
    " | State: " + state_name +
	" | " + string(scribble[| __SCRIBBLE.TW_SPEED]) +
	" | " + string(scribble[| __SCRIBBLE.TW_POSITION]) +
	(pause_timer > 0 ? " (" + string(pause_timer) + ")" : "");
    
    // Choice addition
    if (type == TbyType.Choice) {
        _ds += " | Selected choice: " + string(choice_selected);
    }
    
    var _cam = tby_game_camera;
    var _cw = _cam != -1 ? camera_get_view_width(_cam) : tby_game_width;
    
    var _debug_width = _dim[TbyDim.x2] - _dim[TbyDim.x1];
    tby_draw_debug(_dim[TbyDim.x1], _dim[TbyDim.y1]-string_height_ext(_ds, -1, _debug_width), _ds, _debug_width);
}
#endregion