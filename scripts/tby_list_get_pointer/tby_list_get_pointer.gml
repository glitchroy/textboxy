/// @desc Return the current TbyList pointer.
/// @param _tby_list
var _tby_list/*:TbyList*/ = argument0;

var _meta/*:TbyListMeta*/ = tby_list_meta(_tby_list);
return _meta[TbyListMeta.Pointer];