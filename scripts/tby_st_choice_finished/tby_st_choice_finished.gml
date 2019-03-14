var choiceLength = tby_arrlen(choices)-1

if (tby_input_choice_up) {
    selectedChoice--;
    if (selectedChoice < 0) {
        selectedChoice = choiceLength;
    }
}

if (tby_input_choice_down) {
    selectedChoice++;
    if (selectedChoice > choiceLength) {
        selectedChoice = 0;
    }
}

if (tby_input_confirm) {
    global.tby_choice_result = selectedChoice;
    tby_state_switch("Vanishing")
    
    tby_branch_next_entry()
}

scribble_step(textScribble);