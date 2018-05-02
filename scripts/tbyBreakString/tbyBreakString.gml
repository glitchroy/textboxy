///@function tbyBreakString(string, maxWidth)
///@desc Breaks a string on given width in pixels, returns array
///@param string
///@param maxWidth in pixels

#region Explanation
/* To explain this script properly:
We have a maximum width in pixels and want to know at
what character index (starting from 1) we want to split
the string into two parts. This is a bit tricky, since
we can't easily translate a width in pixels into a
width in characters.
What we do here is half the character length of the string
until we reach a width in pixels that is lower than the
given maximum. After that, we advance character-by-character
until we reach the max.
For better readability, we don't break exactly at the maximum
width (this would result in breaking the middle of a word),
but we go back yet again until we encounter an adequate
character like a whitespace or comma. 

Finally, we return an array of the now broken string.
Note that potentially only the first half will be
shorter than the maximum width, but we deal with
that in later. */
#endregion

var s = argument0;
var w = argument1;

var sw = string_width(s);

if (sw <= w) return s; //no breaking needed

//Copy half of the string
var sb = s;
sb = string_copy(sb, 1, floor(string_length(sb)/2));

// Half string until we are lower than the min width
while (string_width(sb) > w) {
	sb = string_copy(sb, 1, floor(string_length(sb)/2));
}

// String is now shorter than minWidth, get this index
var index = string_length(sb);

// Now go forwards until string is too long
while (string_width(string_copy(s, 1, index)) < w) {
	index++;
}
index--;

// index is now the perfect breaking point
// We would prefer it the string would break on " ", "," or "." though
// So we go back until we encounter one of these
if (string_count(" ", s) || string_count(",", s) || string_count(".", s)) {
	var realIndex = index;
	var charCheck;
	do {
		charCheck = string_char_at(s, --index);
	} until (charCheck = "," || charCheck = "." || charCheck = " ")
	
	if (index < 1) index = realIndex; //reset back if something goes wrong
}
// Return broken string

if (index < 1) return s; //fail save

return [
	string_copy(s, 1, index),
	string_copy(s, index+1, string_length(s))
]