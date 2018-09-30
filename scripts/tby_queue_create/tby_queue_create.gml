/// @param name
var name = argument0;
//#args name

//sanity check
if (global.tbyQueueMap == undefined) {
    global.tbyQueueMap = ds_map_create();
}

//if the queue already exists, clear it
//otherwise, create new queue at name
if(ds_map_exists(global.tbyQueueMap, name)) {
    ds_queue_clear(global.tbyQueueMap[? name])
} else {
    global.tbyQueueMap[? name] = ds_queue_create();
}
return name