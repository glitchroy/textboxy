/// @description Reset

running = false;

if (ds_exists(ds_type_queue, actionQueue)) {
	ds_queue_clear(actionQueue)
}
	
tbyManagerSetup;
