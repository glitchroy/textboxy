/// @param input_slot
/// @param button
/// @param [device]

var _device = ((argument_count >= 3) && (argument[2] != undefined))? argument[2] : 0;

if ( device_mouse_check_button( _device, argument1 ) ) __input_handle_general( argument0, argument1 + 0.3 + _device/100 );