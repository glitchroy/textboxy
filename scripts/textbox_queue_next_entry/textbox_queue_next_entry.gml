var q = textbox_queue_get_active_id()
if (q == undefined || q == -1) {
    exit;
}

if (ds_exists(q, ds_type_queue)) {
    if (ds_queue_size(q) <= 0) {
        //current queue is finished
        //destroy
        textbox_queue_destroy(global.tbActiveQueueName)
        
        //check inactive stack
        if (!ds_queue_empty(global.tbSuspendedQueuesQueue)) {
            var data = ds_queue_dequeue(global.tbSuspendedQueuesQueue);

            //form: queue name, instance id --- See textbox_queue_use()
            if (is_array(data) && instance_exists(data[1])) {
                with (data[1]) {
                    selected = true;
                }
                global.tbActiveQueueName = data[0];
            }
        }
        exit;
    }
    
    //release and create new textbox
    var tbData = ds_queue_dequeue(q)
    
    switch (tbData[0]) {
        case TBType.Normal:
            textbox_create(tbData[1], tbData[2], tbData[3]);
        break;
        case TBType.Choice:
            tbchoice_create(tbData[1], tbData[2], tbData[3]);
        break;
    }
    
}