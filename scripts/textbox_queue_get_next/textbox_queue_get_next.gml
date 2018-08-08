var q = global.tbQueueID
if (ds_exists(q, ds_type_queue) && ds_queue_size(q) > 0) {
    //kick off
    with (ds_queue_dequeue(q)) {
        global.tbQueueInProgress = true;
        releaseFromQueue = true;
        if (selectable) selected = true;
    }
} else {
    global.tbQueueInProgress = false;
}