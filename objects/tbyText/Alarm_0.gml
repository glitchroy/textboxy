if (running) {
	var w = ccGrid[# textCounter-1, TbyControlCode.Wait];
	if (is_real(w) == false || is_undefined(w)) w = tbyDefaultWaitPerChar;
	alarm[0] = w;
}

if (textCounter < string_length(cleanText)) {
	textCounter++;
	typewriterText = string_copy(cleanText, 1, textCounter);

	if (tbyPlaySpeechSound && (textCounter mod tbySpeechIteration == 0)) {
		audio_stop_sound(tbySpeechSound);
		var sound = audio_play_sound(tbySpeechSound, 1, false);
		audio_sound_pitch(sound, tbySpeechPitchChange);
	}
	
} else {
	finished = true;
}