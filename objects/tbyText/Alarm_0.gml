if (running) {
	var w = ccGrid[# textCounter-1, TbyControlCode.Wait];
	if (is_real(w) == false || is_undefined(w)) w = tbyDefaultWaitPerChar;
	alarm[0] = w;
}

if (textCounter < string_length(cleanText)) {
	textCounter++;
	typewriterText = string_copy(cleanText, 1, textCounter);

	//test for skip code ^
	var skipping = ccGrid[# textCounter-2, TbyControlCode.Skip];
	if (skipping != undefined && skipping == true) {
		//skip after text delay
		var delay = ccGrid[# textCounter-2, TbyControlCode.Wait];
		if (is_undefined(delay) || !is_real(delay)) delay = wait;
		alarm[1] = delay;
		exit;
	}

	if (tbyPlaySpeechSound && (textCounter mod tbySpeechIteration == 0)) {
		audio_stop_sound(tbySpeechSound);
		var sound = audio_play_sound(tbySpeechSound, 1, false);
		audio_sound_pitch(sound, tbySpeechPitchChange);
	}
	
} else {
	finished = true;
}