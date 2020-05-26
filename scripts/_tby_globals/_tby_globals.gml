/// @desc Defines globals for textboxy. Executes on boot via gml_pragma.
function _tby_globals() {

	gml_pragma("global", "_tby_globals()");

	// This bool holds if the debug mode for textboxy is active.
	global.tby_debug = tby_debug_on_startup;

	// This int holds the result of the latest TbyChoice call
	global.tby_choice_result = undefined;

	/* This ds_map holds conditions defined in TbyBranches for live comparison. */
	global.tby_conditions = undefined;

	//Create Text layer if it doesn't exist
	layer_set_target_room(room_first);
	if (!layer_exists(tby_room_layer_name)) {
		layer_create(-1000, tby_room_layer_name);
	}
	layer_reset_target_room();

	if (!instance_exists(tby_object_manager)) {
		room_instance_add(room_first, 0, 0, tby_object_manager);
	}


}
