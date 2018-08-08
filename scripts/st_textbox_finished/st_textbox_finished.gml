if (selectable) {
    if (selected) {
        //Confirmation
        if (manInput.confirm) {
            instance_destroy();
            
            if (queue != undefined) {
                textbox_queue_get_next()
            } else {
                //no queue, so select manually
                var next = textbox_find_next_selectable();
                if (next != noone) next.selected = true;
            }
        }
    } else {
        // --> INACTIVE
        state_switch("Inactive")
    }
}

