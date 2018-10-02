if (inst != undefined && instance_exists(inst)) {
    tby_tb_update_position(inst);
    tby_tb_clamp_position()
}

if (selectable) {
    if (selected) {
        //Confirmation
        if (tby_input_confirm) {
            instance_destroy();
            
            tby_queue_next_entry()
        }
    } else {
        // --> INACTIVE
        tby_state_switch("Inactive")
    }
}

