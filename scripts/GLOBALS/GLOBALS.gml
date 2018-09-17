gml_pragma("global", "GLOBALS()")

global.debug = true;
global.pause = false;
global.tbChoiceResult = undefined;

global.tbQueueMap = undefined; //map of ds_queue ids <--> names
global.tbActiveQueueName = undefined; //ds_queue name
global.tbSuspendedQueuesQueue = undefined; //queue of other queues to activate after ^ this ^
global.tbQueueKickoff = false