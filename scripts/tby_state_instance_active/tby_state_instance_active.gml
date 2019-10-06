if (scribble_element == undefined) exit;

if (pause_timer > 0) {
    pause_timer--;
} else {
	scribble_autotype_set(scribble_element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, tw_speed, 0, true);
}

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_autotype_set(scribble_element, SCRIBBLE_TYPEWRITER_NONE, tw_speed, 0, true);
}

var _current_state = scribble_autotype_get(scribble_element);

// --> FINISHED
if (_current_state == 1) {
    tby_state_switch("Finished");
}

// Play audio
if (_current_state > 0 && _current_state < 1) {
	var _config/*:TbyConfig*/ = config;
	var _sound = _config[TbyConfig.Sound];
	
	if (audio_exists(_sound)) {
		var _new_tw_position = scribble_element[@ __SCRIBBLE.AUTOTYPE_POSITION];
		
		if (ceil(tw_position) < ceil(_new_tw_position)) {
			audio_stop_sound(_sound);
			var _audio = audio_play_sound(_sound, 1, false);
			var _pitch_bounds = _config[TbyConfig.SoundPitch];
			var _pitch = 1;
		
			if (is_array(_pitch_bounds)) {
				if (tby_arrlen(_pitch_bounds) > 1) {
					_pitch = tby_arrlen(_pitch_bounds) > 1 ?
					random_range(_pitch_bounds[0], _pitch_bounds[1]) :
					_pitch_bounds[0];
				}
			}
		
			audio_sound_pitch(_audio, _pitch);
		}
	}
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