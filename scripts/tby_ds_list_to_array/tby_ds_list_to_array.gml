/// @desc Converts a ds_list to an array. Returns the array.
/// @param _list_id
var _list_id = argument0;

if (ds_exists(_list_id, ds_type_list) == false) exit;

var _arr = [];

var _s = ds_list_size(_list_id)
for (var i = 0; i < _s; i++) {
    var _inner_list = _list_id[| i];
    
    if (ds_exists(_inner_list, ds_type_list)) {
        
        var _inner = [];
        var _s2 = ds_list_size(_inner_list)
        for (var j = 0; j < _s2; j++) {
            _inner[j] = _inner_list[| j];
        }
        
        _arr[i] = _inner;
    } else {
        _arr[i] = _inner_list;
    }
    
   
}

return _arr;