var q = global.tbQueueID;

//if the queue already exists, just re-use it
//(even it not empty)
//otherwise, create new one
if (q == undefined || !ds_exists(q, ds_type_queue)) {
    global.tbQueueID = ds_queue_create();
}