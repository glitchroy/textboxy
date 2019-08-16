if (stateNew) {
	textScribble[| __SCRIBBLE.TW_SPEED] = 0
}

if (waitTimer > 0) {
    waitTimer--;
} else {
	textScribble[| __SCRIBBLE.TW_SPEED] = textSpeed
    tby_state_switch_previous()
}

scribble_step(textScribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(textScribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
    waitTimer = 0
    tby_state_switch_previous()
}