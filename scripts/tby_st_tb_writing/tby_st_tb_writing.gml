if (textScribble == undefined) exit;

if (stateNew) {
    stateVar[0] = 0 //timer;
}

scribble_step(textScribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
	scribble_typewriter_out(textScribble, SCRIBBLE_TYPEWRITER_WHOLE, 0)
}

var currentState = scribble_typewriter_get_state(textScribble);

// --> FINISHED
if (currentState == 1) {
    tby_state_switch("Finished")
}

//Do every X tick (speed)
if (currentState > 0 && currentState < 1 && stateVar[0] mod textSpeed == 0) {
	//Sound
    audio_stop_sound(tby_default_speech_sound)
	var sound = audio_play_sound(tby_default_speech_sound, 1, false);
	audio_sound_pitch(sound, tby_default_pitch_range);

}
stateVar[0]++;