if (tby_input_confirm) {
    if (type == TbyType.Choice) global.tby_choice_result = selected_choice;
    tby_state_switch("Vanishing")
    
    tby_branch_next_entry(branch)
}

scribble_step(text_scribble);

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_update_position(instance);
        tby_bubble_clamp_position()
    }
}

if (type == TbyType.Choice) {
    var _choice_length = tby_arrlen(choices)-1
    
    if (tby_input_choice_up) {
        selected_choice--;
        if (selected_choice < 0) {
            selected_choice = _choice_length;
        }
    }
    
    if (tby_input_choice_down) {
        selected_choice++;
        if (selected_choice > _choice_length) {
            selected_choice = 0;
        }
    }
}