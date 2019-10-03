if (state_new) {
	scribble_typewriter_set_speed(scribble, 0);
	draw_input_circle = true;
}

if (tby_input_confirm) {
	scribble_typewriter_set_speed(scribble, tw_speed);
	draw_input_circle = false;
    tby_state_switch_previous();
}

scribble_step(scribble);

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_position_update(instance);
        tby_bubble_position_clamp();
    }
}