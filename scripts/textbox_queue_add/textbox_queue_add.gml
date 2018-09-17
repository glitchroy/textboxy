/// @param type
/// @param args = []
var type = argument[0];
var args = argument_count > 1 ? argument[1] : [];

//Args Normal --> Text, CanSelect, Size
//Args Choice --> Text, ChoiceArray, Size

if (ds_exists(textbox_queue_get_active_id(), ds_type_queue)) {
    //part of queue
    ds_queue_enqueue(textbox_queue_get_active_id(), concat([type], args))
    queue = global.tbActiveQueueName;
}