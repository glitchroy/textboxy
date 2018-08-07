/// @function stateCleanup()
/// @description [Clean Up Event] Destroys state data structures.

ds_map_destroy(stateMap);
ds_map_destroy(stateKeys);

ds_stack_destroy(stateStack);