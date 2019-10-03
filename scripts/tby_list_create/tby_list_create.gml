/// @desc Creates a new TbyListe object. Returns the identifier, which is a ds_list.
var _l = ds_list_create();
_l[| 0] = tby_list_create_meta(); // tby_list information

return _l;