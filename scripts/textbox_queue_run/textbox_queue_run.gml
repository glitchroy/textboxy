//only run if queue is not already in progress
//if it is, the new textboxes will just get enqueued
if (!global.tbQueueInProgress) textbox_queue_get_next()