if (state_new) {
    draw_input_circle = true;
}

if (tby_input_confirm) {
    if (type == TbyType.Choice) global.tby_choice_result = choice_selected;
    tby_state_switch("Vanishing");
    
    // Callback to next textbox
    with (tby_object_manager) {
        tby_branch_next(branch);
    }
}

scribble_step(scribble);

// Choice cursor movements
if (type == TbyType.Choice) {
    var _choice_length = tby_arrlen(choices)-1;
    
    if (tby_input_choice_up) {
        choice_selected--;
        if (choice_selected < 0) {
            choice_selected = _choice_length;
        }
    }
    
    if (tby_input_choice_down) {
        choice_selected++;
        if (choice_selected > _choice_length) {
            choice_selected = 0;
        }
    }
}

// Update instance position in Bubble
if (type == TbyType.Bubble) {
    if (instance != undefined && instance_exists(instance)) {
        if (instance.xprevious != instance.x ||instance.yprevious != instance.y) {
        	var _dim/*:TbyDim*/ = dimensions;
        	var _skin/*:TbySkin*/ = skin;
        	
        	tby_dim_position_update(_dim, instance, sprite_get_height(_skin[TbySkin.Bubble]));
        	tby_dim_position_clamp(_dim, 0, 0, tby_game_width, tby_game_height);
        }
    }
}