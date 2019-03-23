var map = global.tby_branches;

if (map == undefined || map == -1) exit;
if (!ds_exists(map, ds_type_map)) exit;
if (ds_map_size(map) <= 0) exit;

// Loop through map and destroy every ds entry

var size = ds_map_size(map)
var key = ds_map_find_first(map);
for (var i = 0; i < size; i++) {
    var branchPayload = map[? key]
    
    // Per payload array
    ds_list_destroy(branchPayload[TbyBranch.MessageList]);
    ds_map_destroy(branchPayload[TbyBranch.LabelMap]);
    ds_map_destroy(branchPayload[TbyBranch.OptionsMap]);
    branchPayload = 0;
    //
    
    key = ds_map_find_next(map, key);
}