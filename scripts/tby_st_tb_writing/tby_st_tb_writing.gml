if (textScribble == undefined) exit;

// Skip to end of textbox
if (tby_input_advance_textbox) {
    typewriterPos = scribble_get_length(textScribble)
}

// --> FINISHED
if ((typewriterPos >= scribble_get_length(textScribble))) {
    tby_state_switch("Finished")
}

if (stateNew) {
    stateVar[0] = 0 //timer;
}

//Do every X tick (speed)
if (stateVar[0] mod textSpeed == 0) {

    //Clear event states
    scribble_step(textScribble, x, y, mouse_x, mouse_y );
    
    //Updates typewriterPos and scan for events
    typewriterPos = scribble_events_scan_range(textScribble, typewriterPos, typewriterPos+0.5);
    
    //Execute event callbacks
    scribble_events_callback(textScribble,
    						 "wait", tby_tb_handle_wait,
    						 "speed", tby_tb_handle_speed)
    
    //Limit string to length
    typewriterPos = min(typewriterPos, scribble_get_length(textScribble));
    
    //Typewriter effect
    scribble_set_char_fade_in( textScribble, typewriterPos, smoothness);
    
	//Sound
	if (frac(typewriterPos) == 0) {
	    audio_stop_sound(tby_default_speech_sound)
		var sound = audio_play_sound(tby_default_speech_sound, 1, false);
		audio_sound_pitch(sound, tby_default_pitch_range);
	}

}
stateVar[0]++;