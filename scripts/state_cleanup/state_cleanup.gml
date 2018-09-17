/// @function stateCleanup()
/// @description [Clean Up Event] Destroys state data structures.

if (ds_exists(stateMap, ds_type_map)) {
    ds_map_destroy(stateMap);
}

if (ds_exists(stateKeys, ds_type_map)) {
    ds_map_destroy(stateKeys);
}

if (ds_exists(stateStack, ds_type_stack)) {
    ds_stack_destroy(stateStack);
}