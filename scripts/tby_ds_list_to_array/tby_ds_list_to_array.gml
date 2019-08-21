/// @desc Converts a ds_list to an array. Returns the array.
/// @param _list_id
var _list_id = argument0;

if (ds_exists(_list_id, ds_type_list) == false) exit;

var _arr = [];

var _s = ds_list_size(_list_id)
for (var i = 0; i < _s; i++) {
    var _inner_value = _list_id[| i];
    
    /*if (ds_exists(_inner_value, ds_type_list)) {
        
        var _inner = [];
        var _s2 = ds_list_size(_inner_value)
        for (var j = 0; j < _s2; j++) {
            _inner[j] = _inner_value[| j];
        }
        
        _arr[i] = _inner;
    } else {*/
        _arr[i] = _inner_value;
    //}
    
   
}

return _arr;