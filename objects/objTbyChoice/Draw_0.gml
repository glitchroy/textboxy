event_inherited();

var _text_dim/*:TbyPos*/ = tby_array_clone(pos)

// Choices
if (state_name == "Finished") {
    var _arrow = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Arrow);

    var _height_offset = tby_pos_height_from_lines(choice_first_line + selected_choice)
    
    draw_sprite(_arrow, -1, _text_dim[TbyPos.x]+3, _text_dim[TbyPos.y]+_height_offset+2)

}

#region Debug
if (global.tby_debug) {
    var _padding = tby_tile_size;
    var _box_dim = [_text_dim[TbyPos.x]-_padding, _text_dim[TbyPos.y]-_padding, _text_dim[TbyPos.x]+_text_dim[TbyPos.width]+_padding, _text_dim[TbyPos.y]+_text_dim[TbyPos.height]+_padding]

    var _choice = -1;
    if (variable_instance_exists(id, "selected_choice")) _choice = selected_choice;
    tby_draw_debug(_box_dim[2]-80, _box_dim[1]-_padding-5, "Selected choice: " + string(_choice));
}
#endregion