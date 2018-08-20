/// @param name
var name = argument0;
//#args name

//if the queue already exists, clear it
//otherwise, create new queue at name
if(ds_map_exists(global.tbQueueMap, name)) {
    ds_queue_clear(global.tbQueueMap[? name])
} else {
    global.tbQueueMap[? name] = ds_queue_create();
}
return name