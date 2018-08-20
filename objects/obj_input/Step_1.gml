input_refresh_begin();

//Note that we can stack many different inputs for the same input slot
//This system supports gamepad axis, gamepad button, keyboard button, and mouse button input

input_handle_gamepad_button( E_INPUT_SLOT.CONFIRM, gamepad_device, gp_face1 );
input_handle_keyboard(       E_INPUT_SLOT.CONFIRM, vk_space, vk_enter );
input_handle_mouse(          E_INPUT_SLOT.CONFIRM, mb_left );

input_handle_keyboard(       E_INPUT_SLOT.UP, vk_up, ord("W"), ord("I") );

input_handle_keyboard(       E_INPUT_SLOT.DOWN, vk_down, ord("S"), ord("K") );

input_handle_gamepad_button( E_INPUT_SLOT.MENU, gamepad_device, gp_face2 );
input_handle_keyboard(       E_INPUT_SLOT.MENU, vk_rcontrol, vk_control, vk_lcontrol );
input_handle_mouse(          E_INPUT_SLOT.MENU, mb_right );

input_refresh_end(); //Actual state processing happens in this script