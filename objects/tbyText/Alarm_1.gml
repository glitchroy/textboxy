/// @description Extend counter and check finish condition

if (textCounter < string_length(cleanText)) {
	textCounter++;
	typewriterText = string_copy(cleanText, 1, textCounter);

	//Audio Medic!
	if (tbyPlaySpeechSound && (textCounter mod tbySpeechIteration == 0)) {
		audio_stop_sound(tbySpeechSound);
		var sound = audio_play_sound(tbySpeechSound, 1, false);
		audio_sound_pitch(sound, tbySpeechPitchChange);
	}
	
	alarm[0] = 1; // right back to the delay counter
	
} else {
	finished = true;
}