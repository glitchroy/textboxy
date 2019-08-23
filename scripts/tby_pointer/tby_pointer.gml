/// @param _variable_string
/// @param _instance_scope = "global"
var _variable_string = argument[0];
var _instance_scope = argument_count > 1 ? argument[1] : "global";

return [
    "TBY_POINTER",
    _instance_scope,
    _variable_string
]
