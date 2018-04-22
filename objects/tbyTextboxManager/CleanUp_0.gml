if (ds_exists(ds_type_queue, actionQueue)) {
	ds_queue_destroy(actionQueue);
}