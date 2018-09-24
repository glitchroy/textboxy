if (selectable) {
    if (selected) {
        //Confirmation
        if (tbyInputConfirm) {
            instance_destroy();
            
            tby_queue_next_entry()
        }
    } else {
        // --> INACTIVE
        state_switch("Inactive")
    }
}

