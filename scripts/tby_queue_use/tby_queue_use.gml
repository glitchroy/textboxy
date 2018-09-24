/// @param name
var name = argument0;

if (global.tbyActiveQueueName != name) {
    //new active queue
    with (tby_object_textbox) {
        //deselect any active textboxes
        if (selected = true) {
            //if there is any active textbox, a queue will be suspended
            selected = false;
            ds_queue_enqueue(global.tbySuspendedQueuesQueue, [global.tbyActiveQueueName, id])
        }
    }
    global.tbyActiveQueueName = name
}
global.tbyQueueKickoff = false