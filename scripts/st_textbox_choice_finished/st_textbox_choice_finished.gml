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
    
    if (queue != undefined) {
        textbox_queue_get_next()
    } else {
        //no queue, so select manually
        var next = textbox_find_next_selectable();
        if (next != noone) next.selected = true;
    }
}