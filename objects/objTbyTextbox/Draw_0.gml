if (state_name == "Init" || state_name == "Vanishing") exit;
if (text_scribble == undefined) exit;

// Define variables to work with
var _padding = tby_tile_size;
var _content_dim/*:TbyPos*/ = tby_array_clone(pos)
var _box_dim = [
        _content_dim[TbyPos.x]-_padding,
        _content_dim[TbyPos.y]-_padding,
        _content_dim[TbyPos.x]+_content_dim[TbyPos.width]+_padding,
        _content_dim[TbyPos.y]+_content_dim[TbyPos.height]+_padding
    ]

// Background and Content draw
tby_draw_box(_box_dim[0], _box_dim[1], _box_dim[2], _box_dim[3]);
scribble_draw(text_scribble, _content_dim[TbyPos.x]-1, _content_dim[TbyPos.y]-1);

#region Finished circle
if (state_name == "Finished") {
    var _circle_sprite = tby_array_get(
                             tby_branch_get_option(
                                 global.tby_active_branch,
                                 TbyOption.SetSkin),
                             TbySkin.Pause)
    draw_sprite(_circle_sprite, -1,
                _content_dim[TbyPos.x]+_content_dim[TbyPos.width]+_padding,
                _content_dim[TbyPos.y]+_content_dim[TbyPos.height]+_padding)
}
#endregion

#region Bubble type
if (type == TbyType.Bubble) {
    //Bubble sprite
    if (inst != undefined && instance_exists(inst) && !size_clamped) {
        var _bubble_sprite = tby_array_get(
                                 tby_branch_get_option(
                                     global.tby_active_branch,
                                     TbyOption.SetSkin),
                                 TbySkin.Bubble)
        tby_draw_sprite(_bubble_sprite,
                        _box_dim[0]+(_box_dim[2]-_box_dim[0])/2,
                        _content_dim[TbyPos.y]+_content_dim[TbyPos.height]+_padding)
    }
}
#endregion

#region Choice type
if (type == TbyType.Choice) {
    // Choices
    if (state_name == "Finished") {
        var _arrow = tby_array_get(
                         tby_branch_get_option(
                             global.tby_active_branch,
                             TbyOption.SetSkin),
                         TbySkin.Arrow);
    
        var _height_offset = tby_pos_height_from_lines(choice_first_line +
                                                      selected_choice)
        
        draw_sprite(_arrow, -1,
                    _content_dim[TbyPos.x]+3,
                    _content_dim[TbyPos.y]+_height_offset+2)
    
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
    draw_rectangle(_content_dim[TbyPos.x], _content_dim[TbyPos.y],
                   _content_dim[TbyPos.x]+_content_dim[TbyPos.width],
                   _content_dim[TbyPos.y]+_content_dim[TbyPos.height],
                   true); //inner
    draw_set_alpha(1)

    var _ds;
    _ds = string(id-100000) +
	//"| Pos: " + string(position) + "/" + string(scribble_get_length(text)) +
    " | State: " + state_name +
	" | " + string(text_scribble[| __SCRIBBLE.TW_SPEED]) +
	" | " + string(text_scribble[| __SCRIBBLE.TW_POSITION]);
    
    // Choice addition
    if (type == TbyType.Choice) {
        var _choice = -1;
        if (variable_instance_exists(id, "selected_choice")) _choice = selected_choice;
        _ds += " | Selected choice: " + string(_choice)
    }
    
    tby_draw_debug(_box_dim[0], _box_dim[1]-_padding-5, _ds);
}
#endregion