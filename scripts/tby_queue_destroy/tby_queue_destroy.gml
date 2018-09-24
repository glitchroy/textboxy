/// @param name
var name = argument0;


var q = tby_queue_get_id(name)
if (q != undefined && ds_exists(q, ds_type_queue)) {
    ds_queue_destroy(q)
    ds_map_delete(global.tbyQueueMap, name)
    if (global.tbyActiveQueueName == name) {
        global.tbyActiveQueueName = undefined;
        global.tbyQueueKickoff = false
    }
}