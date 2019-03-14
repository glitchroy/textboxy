if (textScribble == undefined) exit;

if (stateNew) {
    stateVar[0] = 0 //timer;
}

scribble_step(textScribble);

// Skip to end of textbox
if (tby_input_advance_textbox) {
    //typewriterPos = scribble_get_length(textScribble)
}

var currentState = scribble_typewriter_get_state(textScribble);
tby_log(currentState)

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