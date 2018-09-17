textbox_queue_reset_map()
if (ds_exists(global.tbQueueMap, ds_type_map)) {
    ds_map_destroy(global.tbQueueMap)
}
if (ds_exists(global.tbSuspendedQueuesQueue, ds_type_queue)) {
    ds_queue_destroy(global.tbSuspendedQueuesQueue)
}
