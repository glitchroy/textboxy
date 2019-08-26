if (text_scribble == undefined) exit;

if (state_new) {
    state_var[0] = 0 //timer;
}

scribble_step(text_scribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(text_scribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
}

var _current_state = scribble_typewriter_get_state(text_scribble);

// --> FINISHED
if (_current_state == 1) {
    tby_state_switch("Finished")
}

//Do every X tick (speed)
if (_current_state > 0 && _current_state < 1 && state_var[0] mod typewriter_speed == 0) {
	//Sound
	var _sound = tby_branch_config_get(branch, TbyConfig.Sound)
	if (audio_exists(_sound)) {
	    audio_stop_sound(_sound)
		var _audio = audio_play_sound(_sound, 1, false);
		var _pitch_bounds = tby_branch_config_get(branch, TbyConfig.SoundPitch)
		var _pitch = 1
		
		if (is_array(_pitch_bounds)) {
			if (tby_arrlen(_pitch_bounds) > 1) {
				_pitch = tby_arrlen(_pitch_bounds) > 1 ?
				random_range(_pitch_bounds[0], _pitch_bounds[1]) :
				_pitch_bounds[0]
			}
		}
		
		audio_sound_pitch(_audio, _pitch);
	}
}
state_var[0]++;

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_position_update(instance);
        tby_bubble_position_clamp()
    }
}