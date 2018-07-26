/// @param input_slot
/// @param keyboard_button
/// @param [keyboard_button]

for( var _i = 1; _i < argument_count; _i++ ) {
    if ( keyboard_check( argument[_i] ) ) __input_handle_general( argument[0], argument[_i] );
}