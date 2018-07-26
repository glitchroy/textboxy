/// @param input_slot
/// @param device
/// @param axis
/// @param threshold

if ( gamepad_is_connected( argument1 ) ) {
    if ( gamepad_axis_value( argument1, argument2 )*sign( argument3 ) > abs( argument3 ) ) {
        __input_handle_general( argument0, argument2 + 0.1 + argument1/100 );
    }
}