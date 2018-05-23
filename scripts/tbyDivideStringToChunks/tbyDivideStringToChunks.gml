///@function tbyDivideStringToChunks(string)
///@desc Returns ds_list of a string split up into chunks (either control code or single char)
///@param string

var s = argument0;
var l = ds_list_create();

for (var i = 1; i <= string_length(s); i++) {
	var c = string_char_at(s, i);
	
	if (c == tbyControlCodeOpening) {
		// Loop until end opening is reached
		for (var j = i; j <= string_length(s); j++) {
			var cont = false;
			if (string_char_at(s, j) == tbyControlCodeClosing) {
				ds_list_add(l, string_copy(s, i, j-i+1));
				s = string_delete(s, i, j-i);
				cont = true;
				break;
			}
		}
		if (cont) continue;
	}
	// Normal char or No end found
	ds_list_add(l, c);
}

return l;