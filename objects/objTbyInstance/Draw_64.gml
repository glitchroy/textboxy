if (scribble_element == undefined) exit;

var _skin/*:TbySkin*/ = skin;
var _dim/*:TbyDim*/ = dimensions;
var _config/*:TbyConfig*/ = config;

tby_draw_frame(_dim[TbyDim.x1], _dim[TbyDim.y1], _dim[TbyDim.x2], _dim[TbyDim.y2], _skin[TbySkin.TileSize], _skin[TbySkin.Frame]);

scribble_draw_set_animation(
	_config[TbyConfig.WaveSize],
	_config[TbyConfig.WaveFrequency],
	_config[TbyConfig.WaveSpeed],
	_config[TbyConfig.ShakeSize],
	_config[TbyConfig.ShakeSpeed],
	_config[TbyConfig.RainbowWeight],
	_config[TbyConfig.RainbowSpeed]
	);
	
scribble_draw_set_blend(tby_default_color, 1);
	
tw_position = scribble_element[@ __SCRIBBLE.AUTOTYPE_POSITION];
scribble_draw(_dim[TbyDim.x_content], _dim[TbyDim.y_content], scribble_element);

scribble_draw_reset();

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
    var _height_offset =  tby_dim_line_height(scribble_element, choice_first_line + choice_selected + 1);

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
	" | " + string(scribble_element[@ __SCRIBBLE.AUTOTYPE_SPEED]) +
	" | " + string(scribble_autotype_get(scribble_element)) +
	(pause_timer > 0 ? " (" + string(pause_timer) + ")" : "");
    
    // Choice addition
    if (type == TbyType.Choice) {
        _ds += " | Selected choice: " + string(choice_selected);
    }
    
    var _debug_width = tby_game_width - _dim[TbyDim.x1];
    tby_draw_debug(_dim[TbyDim.x1], _dim[TbyDim.y1]-string_height_ext(_ds, -1, _debug_width), _ds, _debug_width);
}
#endregion