/// @description Get current delay before showing character

if (running && !finished) {
	var tc = clamp(textCounter, 0, string_length(cleanText)-1);
	
	var w = ccGrid[# tc, TbyCode.Wait];
	if (is_real(w) == false || is_undefined(w)) w = wait;
	
	//test for skip code ^
	var skipping = ccGrid[# tc, TbyCode.Skip];
	if (skipping != undefined && skipping == true) {
		//skip after text delay
		alarm[2] = w;
	} else {
		// Normal processing
		alarm[1] = w;
	}
}