/// @desc Converts a ds_queue to an array.
/// @param queue_id
var queue_id = argument0;

if (ds_exists(queue_id, ds_type_queue) == false) exit;

var arr = [];

var s = ds_queue_size(queue_id)
for (var i = 0; i < s; i++) {
    arr[i] = ds_queue_dequeue(queue_id);
}

return arr;