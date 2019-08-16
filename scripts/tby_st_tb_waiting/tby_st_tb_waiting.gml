if (state_new) {
	text_scribble[| __SCRIBBLE.TW_SPEED] = 0
}

if (wait_timer > 0) {
    wait_timer--;
} else {
	text_scribble[| __SCRIBBLE.TW_SPEED] = text_speed
    tby_state_switch_previous()
}

scribble_step(text_scribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(text_scribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
    wait_timer = 0
    tby_state_switch_previous()
}