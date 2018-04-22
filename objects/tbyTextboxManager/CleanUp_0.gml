if (ds_exists(ds_type_queue, actionQueue)) {
	ds_queue_destroy(actionQueue);
}

if (ds_exists(ds_type_map, ccMap)) {
	ds_map_destroy(ccMap);
}
