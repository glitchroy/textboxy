if (running) {
	alarm[0] = ccGrid[# textCounter-1, TbyControlCode.Wait];
}

if (textCounter < string_length(cleanText)) {
	textCounter++;
	typewriterText = string_copy(cleanText, 1, textCounter);
}