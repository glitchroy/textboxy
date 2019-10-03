/// @desc Returns true if the pointer is at the end of the TbyList.
/// @param _tby_list
var _tby_list/*:TbyList*/ = argument0;

if (tby_list_is_valid(_tby_list)) {
    // pointer out of bounds = finished
    return (tby_list_get_pointer(_tby_list) >= tby_list_size(_tby_list));
}