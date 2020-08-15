function tby_log() {
	//if (!tby_debug_do_output) exit;

	var _s = "";

	for (var i = 0; i < argument_count; i++) {
		var _arg = argument[i];
		//if (is_array(_arg)) _arg = _tby_print_array(_arg);
	
		_s += string(_arg) + " | ";
	}

	show_debug_message("[TBY " + string(current_time) + "] " + _s);


};

function tby_error() {
	//if (!tby_debug_do_output) exit;

	var _s = "";

	for (var i = 0; i < argument_count; i++) {
		var _arg = argument[i];
		//if (is_array(_arg)) _arg = _tby_print_array(_arg);
	
		_s += string(_arg) + "\n";
	}

	show_message(_s);


};

function tby_undefined_safe(_value, _fallback) {
	return is_undefined(_value) ? _fallback: _value; 
};

function tby_spread(_script, _args) {
	if (is_undefined(_args)) {
	    return script_execute(_script);
	} 
	
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
/*
function tby_list_from_array(_array) {
	var _l = ds_list_create();
	
	for (var i = 0; i < array_length(_array); i++) {
		ds_list_add(_l, _array[i]);
	}
	
	return _l;
};*/