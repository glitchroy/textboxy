var choice_length = tby_arrlen(choices)-1

if (tby_input_choice_up) {
    selected_choice--;
    if (selected_choice < 0) {
        selected_choice = choice_length;
    }
}

if (tby_input_choice_down) {
    selected_choice++;
    if (selected_choice > choice_length) {
        selected_choice = 0;
    }
}

if (tby_input_confirm) {
    global.tby_choice_result = selected_choice;
    tby_state_switch("Vanishing")
    
    tby_branch_next_entry()
}

scribble_step(text_scribble);