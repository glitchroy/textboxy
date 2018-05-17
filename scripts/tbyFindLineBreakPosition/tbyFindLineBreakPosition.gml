///@function tbyFindLineBreakPosition(list, maxIndex)
///@desc Returns an index where a string should be broken (whitespace, comma etc.)
///@param ds_list
///@param maxIndex
var l = argument0;
var maxi = argument1;

if (ds_exists(l, ds_type_list) == false) return undefined;

for (var i = maxi; i >= 0; i--) {
	var c = l[| i];
	
	if (c == " ") {
		ds_list_replace(l, i, "\n");
		return 1;
	}
	if (c == "," || c == "." || c == ";") {
		ds_list_replace(l, i, c+"\n");
		return 1;
	}
}

ds_list_insert(l, maxi, "\n");