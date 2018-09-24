tby_queue_reset_map()
global.tbyActiveQueueName = undefined;

//Create or reset inactive queue stack
var inactiveQueue = global.tbySuspendedQueuesQueue;
if (inactiveQueue == undefined) {
    global.tbySuspendedQueuesQueue = ds_queue_create()
    inactiveQueue = global.tbySuspendedQueuesQueue;
}
if (ds_exists(inactiveQueue, ds_type_stack) && ds_stack_size(inactiveQueue) > 0) {
    ds_stack_clear(inactiveQueue)
}
