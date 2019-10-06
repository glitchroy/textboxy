if (state_new) {
	scribble_autotype_set(scribble_element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, 0, 0, true);
	draw_input_circle = true;
}

if (tby_input_confirm) {
	scribble_autotype_set(scribble_element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, tw_speed, 0, true);
	draw_input_circle = false;
    tby_state_switch_previous();
}

// Update instance position in Bubble
if (type == TbyType.Bubble) {
    if (instance != undefined && instance_exists(instance)) {
    	if (instance.xprevious != instance.x ||instance.yprevious != instance.y) {
	    	var _dim/*:TbyDim*/ = dimensions;
	    	var _skin/*:TbySkin*/ = skin;
	    	
	    	tby_dim_position_update(_dim, instance, sprite_get_height(_skin[TbySkin.Bubble]));
	    	tby_dim_position_clamp(_dim, 0, 0, tby_game_width, tby_game_height);
    	}
    }
}