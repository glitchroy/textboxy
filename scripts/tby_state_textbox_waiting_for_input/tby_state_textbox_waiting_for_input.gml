if (state_new) {
	scribble_typewriter_set_speed(text_scribble, 0)
}

if (tby_input_confirm) {
	scribble_typewriter_set_speed(text_scribble, typewriter_speed)
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