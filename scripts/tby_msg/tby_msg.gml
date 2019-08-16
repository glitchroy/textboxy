/// @desc Prints the given string(s) into the debug console, with current_time prefixed.
if (!tby_do_debug_output) exit;

var _s = "";

for (var i = 0; i < argument_count; i++) {
	_s += string(argument[i]) + " | ";
}

show_debug_message("[TBY " + string(current_time) + "] " + _s);