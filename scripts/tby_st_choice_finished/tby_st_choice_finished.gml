if (inst != undefined && instance_exists(inst)) {
    tby_tb_update_position(inst);
    tby_tb_clamp_position()
}

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