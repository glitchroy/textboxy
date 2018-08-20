/// @param name
var name = argument0;

if (global.tbActiveQueueName = name && global.tbQueueKickoff == false) {
    textbox_queue_next_entry();
    global.tbQueueKickoff = true;
    exit;
}

//only run if queue is not already in progress
//if it is, the new textboxes will just get enqueued
if (global.tbActiveQueueName != name) {
    global.tbActiveQueueName = name
    textbox_queue_next_entry()
    global.tbQueueKickoff = true;
}