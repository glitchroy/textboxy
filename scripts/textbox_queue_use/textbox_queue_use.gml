/// @param name
var name = argument0;

if (global.tbActiveQueueName != name) {
    //new active queue
    with (objTextbox) {
        //deselect any active textboxes
        if (selected = true) {
            //if there is any active textbox, a queue will be suspended
            selected = false;
            ds_queue_enqueue(global.tbSuspendedQueuesQueue, [global.tbActiveQueueName, id])
        }
    }
    global.tbActiveQueueName = name
}
global.tbQueueKickoff = false