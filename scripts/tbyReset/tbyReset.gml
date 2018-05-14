///@function tbyReset()
///@desc Resets current execution

if (!instance_exists(tbyManagerObject)) return -1;

with (tbyM()) {
	if (ds_exists(ds_type_queue, actionQueue)) {
		ds_queue_destroy(actionQueue);
	}
	
	tbyManagerSetup;
	
	// if this is set, we wait a step
	// until reset is completed
	alarm[2] = 1;
}

// Just destroy, do not trigger DESTROY event
instance_destroy(tbyTextObject, false);