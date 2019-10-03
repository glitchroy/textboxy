/// @param _tby_list
var _tby_list/*:TbyList*/ = argument0;

if (tby_list_exists(_tby_list)) {
    return _tby_list[| 0];
}
return undefined;