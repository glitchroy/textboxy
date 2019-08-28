/// @desc Destroys all TbyBranches. Run when exiting a room.

var _map = global.tby_branches;

if (_map == undefined || _map == -1) exit;
if (!ds_exists(_map, ds_type_map)) exit;
if (ds_map_size(_map) <= 0) exit;

// Loop through map and destroy every ds entry

var _size = ds_map_size(_map)
var _key = ds_map_find_first(_map);
for (var i = 0; i < _size; i++) {
    var _branch_payload = _map[? _key]
    
    // Per branch
    tby_branch_destroy(_key)

    _key = ds_map_find_next(_map, _key);
}

ds_map_clear(_map)