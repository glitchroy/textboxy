#macro tby_default_config { \
	skin: [spr_tby_skin_frame_d, \
           spr_tby_skin_bubble_d, \
           spr_tby_skin_pause_d, \
           spr_tby_skin_arrow_d, \
           8], \
	instance: noone, \
	callback: undefined, \
	placement: "auto", \
	sound: snd_tby_speech_default, \
	sound_pitch: [0.8, 1.2], \
	speed: 0.3 \
} 

#macro tby_input_confirm (keyboard_check_pressed( \
	                      vk_enter) || \
	                      keyboard_check_pressed( \
	                      vk_space))


/************************/
// old config

/* This config file is meant to last through updates. */
/* Also check scribble_macros(); for additional
   config options. */



#region DEBUGGING OPTIONS

	/* If textboxy should start up in debug mode. Useful for
	   testing. */
#macro tby_debug_on_startup true
	/* If textboxy should print debug output. Should be false
	   in the final build. */
#macro tby_debug_do_output  true

#endregion



#region BASIC GAME INFORMATION

	/* The width and height of the camera viewport.
	   Used in calculating if a talking instance is
	   outside of the camera. */
#macro tby_game_width               480
#macro tby_game_height              270
	/* The view camera. Can be -1 if you don't use
	   a camera. */
#macro tby_game_camera              view_camera[0]
	/* Which instance should be respected when using
	   textbox auto placement. Usually the player.
	   Do not use a object reference, only an instance!
	   Can also be set to noone. */
#macro tby_game_object_respect_auto instance_find(obj_red, 0)

#endregion



#region GENERIC TEXT DEFAULTS

	/* Default and/or fallback options for various things,
	   like skins, fonts and colors. */
#macro tby_default_skin           [spr_tby_skin_frame_d, \
	                                   spr_tby_skin_bubble_d, \
	                                   spr_tby_skin_pause_d, \
	                                   spr_tby_skin_arrow_d, \
	                                   8]
#macro tby_default_color          c_white
#macro tby_default_font           "spr_tby_font_main"
#macro tby_default_speed          0.3

	/* Defaults for scribble text effects. */
#macro tby_default_wave_size      4
#macro tby_default_wave_frequency 50
#macro tby_default_wave_speed     0.2
#macro tby_default_shake_size     4
#macro tby_default_shake_speed    0.4
#macro tby_default_rainbow_weight 0.5
#macro tby_default_rainbow_speed  0.01

#endregion



#region SOUND OPTIONS

	/* Options for text sounds. Very basic, and subject to be
	   swapped out for sound options per-textbox. */
#macro tby_sound_default_speech      snd_tby_speech_default
	/* The upper and lower bounds for the random pitch. */
#macro tby_sound_default_pitch_range [0.8, 1.2]

#endregion



#region ROOM OPTIONS

	/* The name of the layer where textboxy instances are created.
	   Should be above all other visible elements.
	   Will be created automatically if not present in room. */
#macro tby_room_layer_name "Text"

#endregion



#region INPUT OPTIONS

	/* Options for inputs, like navigating the choice textbox
	   or confirming a dialogue.
	   Expressions should evaluate to a boolean. */
/*#macro tby_input_confirm         (keyboard_check_pressed(\
	                                  vk_enter) || \
	                                  keyboard_check_pressed(\
									  vk_space))*/
#macro tby_input_choice_up       (keyboard_check_pressed(\
	                                  vk_up) || \
	                                  keyboard_check_pressed(\
									  ord("A")))
#macro tby_input_choice_down     (keyboard_check_pressed(\
	                                  vk_down) || \
	                                  keyboard_check_pressed(\
									  ord("D")))
#macro tby_input_advance_textbox (keyboard_check_pressed(\
	                                  vk_enter) || \
	                                  keyboard_check_pressed(\
									  vk_space))

#endregion



#region GENERIC TEXTBOX OPTIONS

	/* Image_speed for the textbox confirmation dot. */
#macro tby_generic_blink_speed 1/20
	/* The default width for a standard textbox. */
#macro tby_box_width           (tby_game_width - (tby_game_width/8) * 2)	
	/* The default height in lines for a standard textbox. */
#macro tby_box_lines_per_box   2

#endregion



#region BUBBLE TEXTBOX OPTIONS

	/* The maximum width for a given text bubble,
	   before a line break is inserted.
	   Set to negative for no limit. */
#macro tby_bubble_max_width       120
	/* Which character a message box should be prefixed with
	   to trigger the bubble type automatically.
	   Only one character. */
#macro tby_bubble_quick_mode_char ord("§")

#endregion