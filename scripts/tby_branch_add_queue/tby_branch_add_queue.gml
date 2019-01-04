/*
#args list_id

var source = TbyQueue.get_id(list_id)

if (TbyList.exists(source) == false) exit;

var q = ds_queue_create();
ds_queue_copy(q, queue_source);
//TODO: Might need to change everything to lists, because
//labels and circular skipping not possible with queues
var s = ds_queue_size(q)
for (var i = 0; i < s; i++) {
    var args_array = ds_queue_dequeue(q)
    
    // simulate tby_branch_add, since we already
    // have the args packaged as array
    
    ds_queue_enqueue(TbyQueue.get_active_id(), args_array)
}

ds_queue_destroy(q)