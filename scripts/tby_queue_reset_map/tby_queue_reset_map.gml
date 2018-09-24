var map = global.tbyQueueMap;

if (map == undefined || map == -1) exit;
if (!ds_exists(map, ds_type_map)) exit;
if (ds_map_size(map) <= 0) exit;

var size = ds_map_size(map)
var key = ds_map_find_first(map);
for (var i = 0; i < size; i++) {
    var val = map[? key]
    if (val != undefined && ds_exists(val, ds_type_queue)) {
        ds_queue_destroy(val);
    }
    key = ds_map_find_next(map, key);
}

global.tbyQueueKickoff = false