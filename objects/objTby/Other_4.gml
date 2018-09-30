tby_queue_reset_map()
global.tbyActiveQueueName = undefined;
tby_reset_options()

//Create or reset inactive queue stack
var inactiveQueue = global.tbySuspendedQueuesQueue;
if (inactiveQueue == undefined) {
    global.tbySuspendedQueuesQueue = ds_queue_create()
    inactiveQueue = global.tbySuspendedQueuesQueue;
}
if (ds_exists(inactiveQueue, ds_type_stack) && ds_stack_size(inactiveQueue) > 0) {
    ds_stack_clear(inactiveQueue)
}

if (global.tbyFinishedQueueList == undefined) {
    global.tbyFinishedQueueList = ds_list_create()
}
if (ds_exists(global.tbyFinishedQueueList, ds_type_list) && ds_list_size(global.tbyFinishedQueueList) > 0) {
    ds_list_clear(global.tbyFinishedQueueList)
}