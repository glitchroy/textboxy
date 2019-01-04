if (waitTimer > 0) {
    waitTimer--;
} else {
    tby_state_switch_previous()
}

// Skip to end of textbox
if (tby_input_advance_textbox) {
    typewriterPos = scribble_get_length(textScribble)
    waitTimer = 0
    tby_state_switch_previous()
}