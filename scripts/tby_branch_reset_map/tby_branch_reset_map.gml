var map = global.tby_list_map;

if (map == undefined || map == -1) exit;
if (!ds_exists(map, ds_type_map)) exit;
if (ds_map_size(map) <= 0) exit;

// Loop through map and destroy every ds entry

var size = ds_map_size(map)
var key = ds_map_find_first(map);
for (var i = 0; i < size; i++) {
    var val = map[? key]
    if (val != undefined && tby_list_exists(val)) {
        tby_list_destroy(val);
    }
    key = ds_map_find_next(map, key);
}

global.tby_list_kickoff = false