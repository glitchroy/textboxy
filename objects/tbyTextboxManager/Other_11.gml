/// @description Start executing actionQueue
if (running) exit;
if (alarm[2] > 0) { delayedStart = true; exit };

running = true;

// Callback
if (script_exists(tbyCbOnQueueBegin)) {
	script_execute(tbyCbOnQueueBegin);
}


tbyManagerNextAction;