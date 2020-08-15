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

function tby_undefined_safe(value, fallback) {
	return is_undefined(value) ? fallback: value; 
};
/*
function tby_list_from_array(_array) {
	var _l = ds_list_create();
	
	for (var i = 0; i < array_length(_array); i++) {
		ds_list_add(_l, _array[i]);
	}
	
	return _l;
};*/