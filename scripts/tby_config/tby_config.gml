/* This config file is meant to last through updates. */
/* Also check */__scribble_config()/* for additional config options. */


#region Basic game information
/* The width and height of the camera viewport. Used in calculating
     if a talking instance is outside of the camera. */
#macro tby_game_width 480
#macro tby_game_height 270
#endregion

/* Default and/or fallback options for various things, like
     skins, fonts and colors. */
#region Basic text defaults
#macro tby_default_skin [sprTbySkinFrameD, sprTbySkinBubbleD, sprTbySkinPauseD, sprTbySkinArrowD]
#macro tby_default_color c_white
#macro tby_default_font "sprTbyFontMain"
#endregion

/* Options for text sounds. Very basic, and subject to be
     swapped out for sound options per-textbox. */
#region Sound options
#macro tby_default_speech_sound sndTbySpeechDefault
#macro tby_default_pitch_range random_range(0.8, 1.2)
#endregion


#region Room options
/* The name of the layer where textboxy instances are created.
     Should be above all other visible elements. Will be created
     automatically if not present in the room. */
#macro tby_layer_text "Text"
#endregion

/* Options for inputs, like navigating the choice textbox
     or confirming a dialogue. Expression should evaluate to a boolean. */
#region Input options
#macro tby_input_confirm (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
#macro tby_input_choice_up (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("A")))
#macro tby_input_choice_down (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("D")))
#macro tby_input_advance_textbox (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
#endregion

/* Options for the textbox bubble type. */
#region Bubble textbox options
/* The maximum width for a given text bubble. */
#macro tby_max_width_bubble 120
/* Which character a message box should be prefixed with to trigger
   the bubble type automatically. */
#macro tby_quick_mode_bubble_char "§"
#endregion

/* Options for handling external files. */
#region External lang files
#macro tby_use_external_lang_file true
/* What external file to use for loading dialogue. Must be a
   .json file added to the included files.*/
#macro tby_default_external_lang_file "lang.json"
#endregion

/* Options with no clear category. */
#region Misc textbox options
/* image_speed for the textbox confirmation dot. */
#macro tby_confirmation_blink_speed 1/20
/* Which instance should be respected when using textbox auto placement.
   Usually the player. Can also be set to noone. */
#macro tby_object_respect_auto_placement objRed
#endregion