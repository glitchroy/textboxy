if (ds_exists(global.tbQueueMap, ds_type_map)) {
    ds_map_destroy(global.tbQueueMap)
}