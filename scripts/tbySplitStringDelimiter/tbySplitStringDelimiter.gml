///@function tbySplitStringDelimiter(string, delimiter, list?)
///@desc Returns a ds_list of the string split at the delimiter
///@param string
///@param delimiter
///@param list?
// Taken from https://yal.cc/gamemaker-split-string/

var s = argument[0], d = argument[1], r;
if (argument_count >= 3) {
    r = argument[2];
    ds_list_clear(r);
} else r = ds_list_create();
var p = string_pos(d, s);
var dl = string_length(d);
if (dl) while (p) {
    p -= 1;
    ds_list_add(r, string_copy(s, 1, p));
    s = string_delete(s, 1, p + dl);
    p = string_pos(d, s);
}
ds_list_add(r, s);
return r;