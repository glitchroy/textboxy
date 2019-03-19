/// @param list_id
var list_id = argument0;

if (ds_exists(list_id, ds_type_list) == false) exit;

var arr = [];

var s = ds_list_size(list_id)
for (var i = 0; i < s; i++) {
    var innerList = list_id[| i];
    
    if (ds_exists(innerList, ds_type_list)) {
        
        var inner = [];
        var s2 = ds_list_size(innerList)
        for (var j = 0; j < s2; j++) {
            inner[j] = innerList[| j];
        }
        
        arr[i] = inner;
    } else {
        arr[i] = innerList;
    }
    
   
}

return arr;