var _scribble_element = scribble_element;
var _tw_speed         = tw_speed;
var _tw_state         = tw_state;
var _type             = type;
var _instance         = instance;
var _dim/*:TbyDim*/       = dimensions;
var _skin/*:TbySkin*/     = skin;

if (_scribble_element == undefined) exit;

if (pause_timer > 0) {
    pause_timer--;
} else {
	tby_scribble_autotype_set_speed(_scribble_element, _tw_speed);
}

// Skip to end of textbox
if (tby_input_advance_textbox) {
	_scribble_element[@ __SCRIBBLE.AUTOTYPE_POSITION] = _scribble_element[@ __SCRIBBLE.CHARACTERS];
}

var _current_state = scribble_autotype_get(_scribble_element);

// --> FINISHED
if (_current_state == 1) {
    tby_state_switch("Finished");
}

// Play audio
if (_current_state > 0 && _current_state < 1) {
	var _config/*:TbyConfig*/ = config;
	var _sound = _config[TbyConfig.Sound];
	
	if (audio_exists(_sound)) {

		if (_tw_state < _current_state) {
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
if (_type == TbyType.Bubble) {
    if (_instance != undefined && instance_exists(_instance)) {
    	if (_instance.xprevious != _instance.x ||_instance.yprevious != _instance.y) {
	    	tby_dim_position_update(_dim, _instance, sprite_get_height(_skin[TbySkin.Bubble]));
	    	tby_dim_position_clamp(_dim, 0, 0, tby_game_width, tby_game_height);
    	}
    }
}