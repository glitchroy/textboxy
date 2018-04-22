if (running) {
	var w = ccGrid[# textCounter-1, TbyControlCode.Wait];
	if (is_real(w) == false || is_undefined(w)) w = tbyDefaultWaitPerChar;
	alarm[0] = w;
}

if (textCounter < string_length(cleanText)) {
	textCounter++;
	typewriterText = string_copy(cleanText, 1, textCounter);
} else {
	finished = true;
}