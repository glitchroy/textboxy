var choiceLength = arr_length(choices)-1

if (manInput.choice_up) {
    selectedChoice--;
    if (selectedChoice < 0) {
        selectedChoice = choiceLength;
    }
}

if (manInput.choice_down) {
    selectedChoice++;
    if (selectedChoice > choiceLength) {
        selectedChoice = 0;
    }
}

if (manInput.confirm) {
    global.tbChoiceResult = selectedChoice;
    instance_destroy();
    
    textbox_queue_next_entry()
}