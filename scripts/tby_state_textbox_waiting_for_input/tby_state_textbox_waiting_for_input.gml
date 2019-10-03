if (state_new) {
	scribble_typewriter_set_speed(text_scribble, 0);
}

if (tby_input_confirm) {
	scribble_typewriter_set_speed(text_scribble, typewriter_speed);
    tby_state_switch_previous();
}

scribble_step(text_scribble);

// Update instance position in Bubble
if (type == TbyType.Bubble) {
    if (instance != undefined && instance_exists(instance)) {
    	if (instance.xprevious != instance.x ||instance.yprevious != instance.y) {
	    	var _dim/*:TbyDimOld*/ = dimensions;
	    	var _skin/*:TbySkin*/ = skin;
	    	
	    	tby_dim_position_update(_dim, instance, sprite_get_height(_skin[TbySkin.Bubble]));
	    	tby_dim_position_clamp(_dim, 0, 0, tby_game_width, tby_game_height);
    	}
    }
}