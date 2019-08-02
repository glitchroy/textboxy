/// @desc Returns true if the pointer is at the end of the TbyList.
/// @param tby_list
var tby_list = argument0;

if (tby_list_is_valid(tby_list)) {
    // pointer out of bounds = finished
    return (tby_list_get_pointer(tby_list) >= tby_list_size(tby_list))
}