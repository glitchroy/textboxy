/// @desc Returns true if the given index is of a valid TbyList. Checks for the IdentifierString meta tag.
/// @param _tby_list
var _tby_list = argument0;

if (ds_exists(_tby_list, ds_type_list)) {
    var _meta = _tby_list[| 0];
    return (_meta[TbyListMeta.IdentifierString] == "TBY_LIST-1.0")
}