/// @description TYPEWRITER speed

//Do not execute if in waiting mode
if (waiting || finished) exit;

//Clear event states
scribble_step(text, x, y, mouse_x, mouse_y );

//Updates position and scan for events
position = scribble_events_scan_range(text, position, position+0.5);

//Execute event callbacks
scribble_events_callback(text,
						 "wait", textbox_handle_wait,
						 "speed", textbox_handle_speed)

//Limit string to length
position = min(position, scribble_get_length(text));

//Typewriter effect
scribble_set_char_fade_in( text, position, smoothness);


alarm[1] = max(1,textSpeed);