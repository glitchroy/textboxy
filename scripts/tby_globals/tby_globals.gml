gml_pragma("global", "tby_globals()")

//this call is usually made in __scribble_init() itself per gml_pragma
__scribble_init();

global.tbyDebug = true;
global.tbyChoiceResult = undefined;

global.tbyQueueMap = undefined; //map of ds_queue ids <--> names
global.tbyActiveQueueName = undefined; //ds_queue name
global.tbySuspendedQueuesQueue = undefined; //queue of other queues to activate after ^ this ^
global.tbyQueueKickoff = false

// From __scrible_init()
if (!instance_exists(tby_object_manager)) {
	room_instance_add(room_first, 0, 0, tby_object_manager);
}