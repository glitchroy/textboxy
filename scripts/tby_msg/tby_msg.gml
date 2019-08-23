/// @desc Prints the given string(s) into the debug console, with current_time prefixed.
if (!tby_do_debug_output) exit;

var _s = "";

for (var i = 0; i < argument_count; i++) {
	var _arg = argument[i];
	if (is_array(_arg)) _arg = tby_print_array(_arg);
	
	_s += string(_arg) + " | ";
}

show_debug_message("[TBY " + string(current_time) + "] " + _s);