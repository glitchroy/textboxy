/// @param identifier
var identifier = argument0;

var map = global.tby_external_strings_map;

if (map != undefined && ds_exists(map, ds_type_map)) {

	var list = ds_map_find_value(map, identifier);

	if (list != undefined) {
	    var arr = tby_list_to_array(list);
	    tby_branch_create(identifier);
	    tby_branch_use(identifier);
		tby_branch_add(TbyType.Batch, arr);
	    tby_branch_run(identifier);
	}

}