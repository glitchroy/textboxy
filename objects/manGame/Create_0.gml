singleton;

instance_create_layer(0, 0, tby_layer_managers, manDisplay);
instance_create_layer(0, 0, tby_layer_managers, manDebug);
instance_create_layer(0, 0, tby_layer_managers, obj_input);
instance_create_layer(0, 0, tby_layer_managers, manInput);
global.tbyQueueMap = ds_map_create();
