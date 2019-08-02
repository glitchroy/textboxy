/// @desc Returns the given string(s) as an error textbox, halting execution.
if (!tby_do_debug_output) exit;

var s = "";

for (var i = 0; i < argument_count; i++) {
	s += string(argument[i]) + " | ";
}

show_message(s);