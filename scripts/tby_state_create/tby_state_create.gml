/// @function state_create(name, script)
/// @description [Any Event] Creates a state for an object.

/// @param {string} name Identifier of the state.
/// @param {script} script Script linking to the state.

ds_map_replace(stateMap, argument[0], argument[1]);

ds_map_replace(stateKeys, argument[1], argument[0]);