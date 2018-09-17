textbox_queue_reset_map()
global.tbActiveQueueName = undefined;

//Create or reset inactive queue stack
var inactiveQueue = global.tbSuspendedQueuesQueue;
if (inactiveQueue == undefined) {
    global.tbSuspendedQueuesQueue = ds_queue_create()
    inactiveQueue = global.tbSuspendedQueuesQueue;
}
if (ds_exists(inactiveQueue, ds_type_stack) && ds_stack_size(inactiveQueue) > 0) {
    ds_stack_clear(inactiveQueue)
}
