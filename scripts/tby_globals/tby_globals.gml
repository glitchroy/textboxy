gml_pragma("global", "tby_globals()")

//this call is usually made in __scribble_init() itself per gml_pragma
__scribble_init();

global.tbyDebug = true;
global.tbyChoiceResult = undefined;
global.tbyCurrentOptionsMap = undefined; tby_reset_options();
global.tbyQueueMap = undefined; //map of ds_queue ids <--> names
global.tbyActiveQueueName = undefined; //ds_queue name
global.tbySuspendedQueuesQueue = undefined; //queue of other queues to activate after ^ this ^
global.tbyQueueKickoff = false
global.tbyFinishedQueueList = undefined;

//Create Text layer if it doesn't exist
layer_set_target_room(room_first)
if (!layer_exists(tby_layer_text)) {
	layer_create(-1000, tby_layer_text);
}
layer_reset_target_room()
	

// From __scrible_init()
if (!instance_exists(tby_object_manager)) {
	room_instance_add(room_first, 0, 0, tby_object_manager);
}