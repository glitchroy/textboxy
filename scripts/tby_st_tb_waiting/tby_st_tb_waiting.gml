if (waitTimer > 0) {
    waitTimer--;
} else {
    tby_state_switch_previous()
}

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(textScribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
    waitTimer = 0
    tby_state_switch_previous()
}