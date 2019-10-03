/// @param _pointer_array
var _pointer_array = argument0;

var _scope = _pointer_array[TbyPointerMeta.Scope];
var _var_name = _pointer_array[TbyPointerMeta.VariableName];

if (_scope == "global") {
    return variable_global_get(_var_name);
}

if (object_exists(_scope)) {
    // Scope is object index, use first instance if found
    var _test_for_inst = instance_find(_scope, 0);
    if (instance_exists(_test_for_inst)) {
        return variable_instance_get(_test_for_inst, _var_name);
    }
} else
if (instance_exists(_scope)) {
    // Scope is instance, use it
    return variable_instance_get(_scope, _var_name);
}

tby_log("Can't apply pointer for scope " + string(_scope) + ".");
return undefined;