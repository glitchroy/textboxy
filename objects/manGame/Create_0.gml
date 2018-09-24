singleton;

instance_create_layer(0, 0, tbyLayerManagers, manDisplay);
instance_create_layer(0, 0, tbyLayerManagers, manDebug);
instance_create_layer(0, 0, tbyLayerManagers, obj_input);
instance_create_layer(0, 0, tbyLayerManagers, manInput);
global.tbyQueueMap = ds_map_create();
