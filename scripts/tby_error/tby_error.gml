/// @desc Returns the given string(s) as an error textbox, halting execution.
if (!tby_debug_do_output) exit;

var _s = "";

for (var i = 0; i < argument_count; i++) {
	var _arg = argument[i];
	if (is_array(_arg)) _arg = tby_print_array(_arg);
	
	_s += string(_arg) + "\n";
}

show_message(_s);