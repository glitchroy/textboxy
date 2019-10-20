/// @desc Converts a ds_queue to an array.
/// @param _queue_id
var _queue_id = argument0;

if (ds_exists(_queue_id, ds_type_queue) == false) exit;

var _arr = [];

var _s = ds_queue_size(_queue_id);
for (var i = 0; i < _s; i++) {
    _arr[i] = ds_queue_dequeue(_queue_id);
}

return _arr;