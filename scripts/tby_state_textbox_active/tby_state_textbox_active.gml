if (text_scribble == undefined) exit;

if (pause_timer > 0) {
    pause_timer--;
} else {
	scribble_typewriter_set_speed(text_scribble, typewriter_speed)
}

typewriter_position = text_scribble[| __SCRIBBLE.TW_POSITION];

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

// Play audio
if (_current_state > 0 && _current_state < 1) {
	var _sound = tby_branch_config_get(branch, TbyConfig.Sound);
	
	if (audio_exists(_sound)) {
		var _new_tw_position = text_scribble[| __SCRIBBLE.TW_POSITION];
		
		if (ceil(typewriter_position) < ceil(_new_tw_position)) {
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
}

if (type == TbyType.Bubble) {
    // Check instance position
    if (instance != undefined && instance_exists(instance)) {
        tby_bubble_position_update(instance);
        tby_bubble_position_clamp()
    }
}