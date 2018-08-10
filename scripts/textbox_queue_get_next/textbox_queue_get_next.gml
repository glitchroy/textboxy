var q = global.tbQueueID
if (ds_exists(q, ds_type_queue) && ds_queue_size(q) > 0) {
    //kick off
    global.tbQueueInProgress = true;
    with (ds_queue_dequeue(q)) {
        releaseFromQueue = true;
    }
} else {
    global.tbQueueInProgress = false;
}