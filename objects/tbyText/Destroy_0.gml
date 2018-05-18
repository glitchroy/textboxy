/// @description Send signal back to manager
if (tbyPlayConfirmSound) {
	audio_stop_sound(tbyConfirmSound);
	audio_play_sound(tbyConfirmSound, 1, false);
}

// Callback
if (script_exists(tbyCbOnMessageEnd)) {
	script_execute(tbyCbOnMessageEnd);
}

var m = tbyM();
with (m) {
	alarm[0] = 1;
}