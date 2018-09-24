gml_pragma("global", "tby_globals()")

global.debug = true;
global.pause = false;
global.tbyChoiceResult = undefined;

global.tbyQueueMap = undefined; //map of ds_queue ids <--> names
global.tbyActiveQueueName = undefined; //ds_queue name
global.tbySuspendedQueuesQueue = undefined; //queue of other queues to activate after ^ this ^
global.tbyQueueKickoff = false