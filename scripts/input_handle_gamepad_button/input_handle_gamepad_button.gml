/// @param input_slot
/// @param device
/// @param button

if ( gamepad_is_connected( argument1 ) ) {
    if ( gamepad_button_check( argument1, argument2 ) ) {
        __input_handle_general( argument0, argument2 + 0.2 + argument1/100 );
    }
}