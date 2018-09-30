tby_queue_reset_map()
if (ds_exists(global.tbyQueueMap, ds_type_map)) {
    ds_map_destroy(global.tbyQueueMap)
}
if (ds_exists(global.tbySuspendedQueuesQueue, ds_type_queue)) {
    ds_queue_destroy(global.tbySuspendedQueuesQueue)
}
if (ds_exists(global.tbyCurrentOptionsMap, ds_type_map)) {
    ds_map_destroy(global.tbyCurrentOptionsMap)
}