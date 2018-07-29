if (text == undefined) exit;

//Clear event states
scribble_step(text, x, y, mouse_x, mouse_y );

//Confirmation
if (selectable && selected && finished) {
    if (manInput.confirm) {
        instance_destroy();
        var next = textbox_find_next_selectable();
        if (next != noone) next.selected = true;
    }
}

///////////////////
//Do not execute if in waiting mode
if (waiting || finished) exit;


//Updates position and scan for events
position = scribble_events_scan_range(text, position, position+0.5);

//Execute event callbacks
scribble_events_callback(text, "wait", handleWait)

//Limit string to length
position = min( position, scribble_get_length( text ) );

//Typewriter effect
scribble_set_char_fade_in( text, position, smoothness);

//Sound
if (frac(position) == 0) {
    audio_stop_sound(sndSpeechDefault)
	var sound = audio_play_sound(sndSpeechDefault, 1, false);
	audio_sound_pitch(sound, irandom_range(0.8, 1.2));
}

//finished?
finished = (position >= scribble_get_length(text))