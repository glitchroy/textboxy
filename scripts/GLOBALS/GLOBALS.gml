gml_pragma("global", "GLOBALS()")

global.debug = true;
global.pause = false;
global.tbChoiceResult = undefined;

global.tbQueueMap = undefined; //map of ds_queue ids <--> names
global.tbActiveQueueName = undefined; //ds_queue id
global.tbQueueKickoff = false