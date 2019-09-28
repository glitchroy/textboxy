if (state_name == "Init" || state_name == "Vanishing") exit;
if (text_scribble == undefined) exit;

// Define variables to work with
var _padding = skin[TbySkin.TileSize];
var _content_dim/*:TbyDim*/ = tby_array_clone(dimensions)
var _box_dim = [
        _content_dim[TbyDim.x]-_padding,
        _content_dim[TbyDim.y]-_padding,
        _content_dim[TbyDim.x]+_content_dim[TbyDim.width]+_padding,
        _content_dim[TbyDim.y]+_content_dim[TbyDim.height]+_padding
    ]

// Background and Content draw
var _frame = skin[TbySkin.Frame];
tby_draw_frame(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3], skin[TbySkin.TileSize], _frame);
scribble_draw(text_scribble, _content_dim[TbyDim.x]-1, _content_dim[TbyDim.y]-1);

#region Finished circle
if (state_name == "Finished" || state_name == "WaitingForInput") {
    var _circle_sprite = skin[TbySkin.Pause];
    draw_sprite(_circle_sprite, -1,
                _content_dim[TbyDim.x]+_content_dim[TbyDim.width]+_padding,
                _content_dim[TbyDim.y]+_content_dim[TbyDim.height]+_padding)
}
#endregion

#region Bubble type
if (type == TbyType.Bubble) {
    //Bubble sprite
    if (instance != undefined && instance_exists(instance) && !size_clamped) {
        var _bubble_sprite = skin[TbySkin.Bubble]
        draw_sprite(_bubble_sprite, -1,
                    _box_dim[0]+(_box_dim[2]-_box_dim[0])/2,
                    _content_dim[TbyDim.y]+_content_dim[TbyDim.height]+_padding)
    }
}
#endregion

#region Choice type
if (type == TbyType.Choice) {
    // Choices
    if (state_name == "Finished") {
        var _arrow = skin[TbySkin.Arrow];
    
        var _height_offset = tby_get_height_from_lines(choice_first_line +
                                                      selected_choice)
        
        draw_sprite(_arrow, -1,
                    _content_dim[TbyDim.x]+3,
                    _content_dim[TbyDim.y]+_height_offset+2)
    
    }
}
#endregion

#region Debug
if (global.tby_debug) {
    draw_set_alpha(0.75)
    draw_set_color(c_green);
    draw_rectangle(_box_dim[0], _box_dim[1],
                   _box_dim[2], _box_dim[3], true); //outer
    draw_set_color(c_aqua);
    draw_rectangle(_content_dim[TbyDim.x], _content_dim[TbyDim.y],
                   _content_dim[TbyDim.x]+_content_dim[TbyDim.width],
                   _content_dim[TbyDim.y]+_content_dim[TbyDim.height],
                   true); //inner
    draw_set_alpha(1)

    var _ds;
    _ds = string(id-100000) +
	//"| P: " + string(position) + "/" + string(scribble_get_length(text)) +
    " | State: " + state_name +
    (pause_timer > 0 ? " (" + string(pause_timer) + ")" : "") +
	" | " + string(text_scribble[| __SCRIBBLE.TW_SPEED]) +
	" | " + string(text_scribble[| __SCRIBBLE.TW_POSITION]);
    
    // Choice addition
    if (type == TbyType.Choice) {
        var _choice = -1;
        if (variable_instance_exists(id, "selected_choice")) _choice = selected_choice;
        _ds += " | Selected choice: " + string(_choice)
    }
    
    var _cam = tby_game_camera
    var _cw = _cam != -1 ? camera_get_view_width(_cam) : tby_game_width;
    
    var _debug_width = _cw - _box_dim[0]
    tby_draw_debug(_box_dim[0], _box_dim[1]-string_height_ext(_ds, -1, _debug_width), _ds, _debug_width);
}
#endregion