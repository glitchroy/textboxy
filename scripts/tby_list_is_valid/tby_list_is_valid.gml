/// @desc Returns true if the given index is of a valid TbyList. Checks for the IdentifierString meta tag.
/// @param tby_list
var tby_list = argument0;

if (ds_exists(tby_list, ds_type_list)) {
    var meta = tby_list[| 0];
    return (meta[TbyListMeta.IdentifierString] == "TBY_LIST")
}