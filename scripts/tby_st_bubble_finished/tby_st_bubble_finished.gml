if (tby_input_confirm) {
    tby_state_switch("Vanishing")
    
    tby_branch_next_entry()
}

if (inst != undefined && instance_exists(inst)) {
    tby_bubble_update_position(inst);
    tby_bubble_clamp_position()
}

scribble_step(textScribble);