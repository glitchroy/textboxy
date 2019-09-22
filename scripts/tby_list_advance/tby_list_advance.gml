/// @desc Advances the given TbyLists pointer by 1. Also sets the HasBeenAdvanced flag.
/// @param _tby_list
var _tby_list = argument0;

// return current entry and add one
var _entry = tby_list_get_entry_at_pointer(_tby_list)
tby_list_set_pointer(_tby_list, tby_list_get_pointer(_tby_list)+1)

// Set has been advanced in meta
var _meta = _tby_list[| 0];
if (_meta[TbyListMeta.HasBeenAdvanced] == false) {
    _meta[TbyListMeta.HasBeenAdvanced] = true
    ds_list_replace(_tby_list, 0, _meta);
}

return _entry