/// @description Start executing actionQueue
if (running) exit;

running = true;

// Callback
if (script_exists(tbyCbOnQueueBegin)) {
	script_execute(tbyCbOnQueueBegin);
}


tbyManagerNextAction;