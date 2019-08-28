if (state_new) {
	scribble_typewriter_set_speed(text_scribble, 0)
}


if (pause_timer > 0) {
    pause_timer--;
} else {
	scribble_typewriter_set_speed(text_scribble, typewriter_speed)
    tby_state_switch_previous()
}

scribble_step(text_scribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(text_scribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
    pause_timer = 0
    tby_state_switch_previous()
}

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_position_update(instance);
        tby_bubble_position_clamp()
    }
}