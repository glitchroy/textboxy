/// @desc Returns the string representation of a boolean value.
///@param bool
gml_pragma("forceinline");
return argument0 ? "true" : is_undefined(argument0) ? "undefined" : "false"