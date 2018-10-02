var q = tby_queue_get_active_id()
if (q == undefined || q == -1) {
    exit;
}

if (ds_exists(q, ds_type_queue)) {
    if (ds_queue_size(q) <= 0) {
        //current queue is finished
        //destroy
        tby_queue_destroy(global.tbyActiveQueueName)
        
        //check inactive stack
        if (!ds_queue_empty(global.tbySuspendedQueuesQueue)) {
            var data = ds_queue_dequeue(global.tbySuspendedQueuesQueue);

            //form: queue name, instance id --- See tby_queue_use()
            if (is_array(data) && instance_exists(data[1])) {
                with (data[1]) {
                    selected = true;
                }
                global.tbyActiveQueueName = data[0];
            }
        }
        exit;
    }
    
    //release and create new textbox
    var tbData = ds_queue_dequeue(q)
    
    switch (tbData[0]) {
        case TbyType.Normal:
            tby_tb_create(tbData[1], tbData[2], tbData[3]);
        break;
        case TbyType.Choice:
            tby_choice_create(tbData[1], tbData[2], tbData[3]);
        break;
        case TbyType.Option:
            tby_set_option(tbData)
        break;
        case TbyType.Wait:
            with (tby_object_manager) alarm[0] = room_speed*tbData[1]
        break;
    }
    
}