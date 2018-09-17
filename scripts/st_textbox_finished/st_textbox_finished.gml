if (selectable) {
    if (selected) {
        //Confirmation
        if (manInput.confirm) {
            instance_destroy();
            
            textbox_queue_next_entry()
        }
    } else {
        // --> INACTIVE
        state_switch("Inactive")
    }
}

