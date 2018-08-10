if (text == undefined) exit;

// --> FINISHED
if ((position >= scribble_get_length(text))) {
    state_switch("Finished")
}

// --> INACTIVE

if (selectable && !selected) {
    state_switch("Inactive")
}

if (stateNew) {
    stateVar[0] = 0 //timer;
}

//Do every X tick (speed)
if (stateVar[0] mod textSpeed == 0) {

    //Clear event states
    scribble_step(text, x, y, mouse_x, mouse_y );
    
    //Updates position and scan for events
    position = scribble_events_scan_range(text, position, position+0.5);
    
    //Execute event callbacks
    scribble_events_callback(text,
    						 "wait", textbox_handle_wait,
    						 "speed", textbox_handle_speed)
    
    //Limit string to length
    position = min(position, scribble_get_length(text));
    
    //Typewriter effect
    scribble_set_char_fade_in( text, position, smoothness);
    
	//Sound
	if (frac(position) == 0) {
	    audio_stop_sound(sndSpeechDefault)
		var sound = audio_play_sound(sndSpeechDefault, 1, false);
		audio_sound_pitch(sound, irandom_range(0.8, 1.2));
	}

}
stateVar[0]++;