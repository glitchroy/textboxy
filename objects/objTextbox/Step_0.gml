if (text == undefined) exit;

//Confirmation
if (selectable && selected && finished) {
    if (manInput.confirm) {
        instance_destroy();
        var next = textbox_find_next_selectable();
        if (next != noone) next.selected = true;
    }
}


if (waiting || finished) exit;

if (!selectable ^^ (selectable && selected)) {
    //Either not selectable at all or selectable and active, too
	if (alarm[1] <= -1) alarm[1] = max(1,textSpeed);
	
	//Sound
	if (frac(position) == 0) {
	    audio_stop_sound(sndSpeechDefault)
		var sound = audio_play_sound(sndSpeechDefault, 1, false);
		audio_sound_pitch(sound, irandom_range(0.8, 1.2));
	}

} else {
	alarm[1] = -1;
}
//finished?
finished = (position >= scribble_get_length(text))