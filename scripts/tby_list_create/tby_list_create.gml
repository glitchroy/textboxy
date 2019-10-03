/// @desc Creates a new TbyListe object. Returns the identifier, which is a ds_list.
var _list = ds_list_create();
_list[| 0] = tby_list_create_meta(); // tby_list information

return _list;