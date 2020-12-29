function tby_spread(_script, _args) {
	if (is_undefined(_args)) return script_execute(_script);
	
	switch (array_length(_args)) {
	  case 1:
	    return script_execute(_script, _args[@ 0]);
	  case 2:
	    return script_execute(_script, _args[@ 0], _args[@ 1]);
	  case 3:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2]);
	  case 4:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3]);
	  case 5:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4]);
	  case 6:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5]);
	  case 7:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6]);
	  case 8:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7]);
	  case 9:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8]);
	  case 10:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9]);
	  case 11:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10]);
	  case 12:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11]);
	  case 13:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12]);
	  case 14:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12], _args[@ 13]);
	  case 15:
	    return script_execute(_script, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12], _args[@ 13], _args[@ 14]);
	}
};

// _args argument will be passed along to the callback
// Callback function args: list element, index in list, list size, args struct
// Example usage:
// tby_foreach(list, function(_el, i, _size, _args) { ..._args.outside_arg++ ... }, {outside_arg: _outside_arg});
function tby_foreach(_list, _cb, _args) {
	switch (typeof(_list)) {
		case "array":
			if (array_length(_list) <= 0) exit;
		
			for (var i = 0; i < array_length(_list); i++) {
				var _el = _list[@ i];
				_cb(_el, i, array_length(_list), _args);
			}
		break;
		case "number":
			if (ds_exists(_list, ds_type_list) == false) exit;
			if (ds_list_size(_list) <= 0) exit;
			
			for (var i = 0; i < ds_list_size(_list); i++) {
				var _el = _list[| i];
				_cb(_el, i, ds_list_size(_list), _args);
			}
		break;
	}
};

// Courtesy of YAL (https://yal.cc/gamemaker-split-string/)
function tby_split_string(_str, _delimiter) {
	/// string_split(:string, delimiter:string):array<string>
	var rl = global.__tby.string_split_list;
	var p = string_pos(_delimiter, _str), o = 1;
	var dl = string_length(_delimiter);
	ds_list_clear(rl);
	if (dl) while (p) {
	    ds_list_add(rl, string_copy(_str, o, p - o));
	    o = p + dl;
	    p = string_pos_ext(_delimiter, _str, o);
	}
	ds_list_add(rl, string_delete(_str, 1, o - 1));
	// create an array and store results:
	var rn = ds_list_size(rl);
	var rw = array_create(rn);
	for (p = 0; p < rn; p++) rw[p] = rl[|p];
	return rw;
};