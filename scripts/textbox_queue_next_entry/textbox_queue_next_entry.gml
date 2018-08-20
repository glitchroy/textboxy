var q = textbox_queue_get_active_id()
if (q == undefined || q == -1) {
    exit;
}

if (ds_exists(q, ds_type_queue)) {
    if (ds_queue_size(q) <= 0) {
        //destroy
        textbox_queue_destroy(global.tbActiveQueueName)
        exit;
    }
    
    with (ds_queue_dequeue(q)) {
        releaseFromQueue = true;
    }
}