///@func tbySmartLineBreak(font, maxWidth, string)
///@desc Returns a string that fits into maxWidth accounting for line breaks
///@param font
///@param maxWidth
///@param string

//Strip away added carriage return from string literal
var str = string_replace_all(argument2, "\r\n", "\n");
draw_set_font(argument0);
var w = argument1;

// We split the string into an array of manual line breaks
// We skip this if there are no manual line breaks

var stringList = tbySplitString(str, "\n");

// We loop through every substring of stringList and break
// when we reach max width

var i = 0;
while (i < ds_list_size(stringList)) {
	var sub = stringList[| i]; //current substring
	//TODO: Maybe cut out trailing " ", benefit?
	
	var broken = tbyBreakString(sub, w)
	//error(broken)
	if (is_array(broken)) {
		// String was too long and was broken
		// Insert broken string at current and next index
		stringList[| i] = broken[0];
		ds_list_insert(stringList, i+1, broken[1]);
		//do not increase index so we can examine
		//both parts of the new broken string
		continue;
	}
	i++;
}

//Create string from list again
var newStr = "";
for (var i = 0; i < ds_list_size(stringList); i++) {
	newStr += stringList[| i];
	// Do not add \n at the end
	if (i+1 != ds_list_size(stringList)) newStr += "\n"
}

//Destroy list
ds_list_destroy(stringList);

return newStr;