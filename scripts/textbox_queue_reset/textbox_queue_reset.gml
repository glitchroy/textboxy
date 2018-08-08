var q = global.tbQueueID;
if (q != undefined && ds_exists(q, ds_type_queue)) {
    ds_queue_destroy(q)
}
global.tbQueueInProgress = false;
global.tbQueueID = undefined;