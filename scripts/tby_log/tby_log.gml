/// @desc Prints the given string(s) into the debug console, with the current script prefixed.
if (!tby_do_debug_output) exit;

var _s = "";

for (var i = 0; i < argument_count; i++) {
	_s += string(argument[i]) + " | ";
}

var _stack = debug_get_callstack();
var _script = "tby_script";
if (is_array(_stack) && tby_arrlen(_stack) > 1) {
    _script = string_replace(_stack[1], "gml_Script_", "");
}

show_debug_message("[" + string(_script) + "] " + _s);