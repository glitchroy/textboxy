///@function tbyStripControlCodes(string)
///@desc Returns string without valid control codes
///@desc String

var ccChar = tbyControlCodeOpening;

var cleanString = argument0;
while (string_count(ccChar, cleanString) > 0) {
	
	var codeBeginPos = string_pos(ccChar, cleanString);
	
	var codeEndPos = codeBeginPos;
	for (var i = 1; i <= string_length(cleanString); i++) {
		var testChar = string_char_at(cleanString, i);
		
		if (testChar == "" || testChar == tbyControlCodeClosing) {
			codeEndPos = i+1;
			break;
		}
	}
	
	cleanString = string_delete(cleanString, codeBeginPos,
								abs(codeEndPos-codeBeginPos))
}

return cleanString;