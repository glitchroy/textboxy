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
    audio_stop_sound(tby_default_speech_sound)
	var _sound = audio_play_sound(tby_default_speech_sound, 1, false);
	audio_sound_pitch(_sound, tby_default_pitch_range);

}
state_var[0]++;