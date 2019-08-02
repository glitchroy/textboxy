/// @desc Prints the given string(s) into the debug console, with the current script prefixed.
if (!tby_do_debug_output) exit;

var s = "";

for (var i = 0; i < argument_count; i++) {
	s += string(argument[i]) + " | ";
}

var stack = debug_get_callstack();
var script = "tby_script";
if (is_array(stack) && tby_arrlen(stack) > 1) {
    script = string_replace(stack[1], "gml_Script_", "");
}

show_debug_message("[" + string(script) + "] " + s);