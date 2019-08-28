if (state_new) {
	text_scribble[| __SCRIBBLE.TW_SPEED] = 0
}

if (tby_input_confirm) {
	text_scribble[| __SCRIBBLE.TW_SPEED] = typewriter_speed
    tby_state_switch_previous()
}

scribble_step(text_scribble);

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_position_update(instance);
        tby_bubble_position_clamp()
    }
}