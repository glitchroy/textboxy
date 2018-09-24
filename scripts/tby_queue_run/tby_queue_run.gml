/// @param name
var name = argument0;

if (global.tbyActiveQueueName = name && global.tbyQueueKickoff == false) {
    tby_queue_next_entry();
    global.tbyQueueKickoff = true;
    exit;
}

//only run if queue is not already in progress
//if it is, the new textboxes will just get enqueued
if (global.tbyActiveQueueName != name) {
    global.tbyActiveQueueName = name
    tby_queue_next_entry()
    global.tbyQueueKickoff = true;
}