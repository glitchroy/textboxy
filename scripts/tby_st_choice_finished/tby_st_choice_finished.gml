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
    global.tbyChoiceResult = selectedChoice;
    instance_destroy();
    
    tby_queue_next_entry()
}