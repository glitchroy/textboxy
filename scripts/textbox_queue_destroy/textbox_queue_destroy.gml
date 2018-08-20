/// @param name
var name = argument0;


var q = textbox_queue_get_id(name)
if (q != undefined && ds_exists(q, ds_type_queue)) {
    ds_queue_destroy(q)
    ds_map_delete(global.tbQueueMap, name)
    if (global.tbActiveQueueName == name) {
        global.tbActiveQueueName = undefined;
        global.tbQueueKickoff = false
    }
}