/// @desc Returns true if the given index is of a valid TbyList. Checks for the IdentifierString meta tag.
/// @param _tby_list
var _tby_list/*:TbyList*/ = argument0;

var _meta/*:TbyListMeta*/ = _tby_list_meta(_tby_list);
return (_meta[TbyListMeta.IdentifierString] == "TBY_LIST-1.0");