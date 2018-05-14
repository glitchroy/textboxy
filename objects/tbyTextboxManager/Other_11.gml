/// @description Start executing actionQueue
if (running) exit;
if (alarm[2] > 0) { delayedStart = true; exit };
running = true;
tbyManagerNextAction;