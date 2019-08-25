/* This config file is meant to last through updates. */
/* Also check */__scribble_config()/* for additional
   config options. */


/* Debugging options */
#region Debugging options

/* If textboxy should start up in debug mode. Useful for
   testing. */
#macro tby_debug_on_startup true
/* If textboxy should print debug output. Should be false
   in the final build.*/
#macro tby_debug_do_output  true

#endregion


/* Basic game information */
#region Basic game information

/* The width and height of the camera viewport.
   Used in calculating if a talking instance is
   outside of the camera. */
#macro tby_game_width  480
#macro tby_game_height 270

#endregion


/* Default and/or fallback options for various things,
   like skins, fonts and colors. */
#region Basic text defaults

#macro tby_default_skin  [sprTbySkinFrameD, \
                          sprTbySkinBubbleD, \
                          sprTbySkinPauseD, \
                          sprTbySkinArrowD]
#macro tby_default_color c_white
#macro tby_default_font  "sprTbyFontMain"

#endregion


/* Options for text sounds. Very basic, and subject to be
   swapped out for sound options per-textbox. */
#region Sound options

#macro tby_sound_default_speech       sndTbySpeechDefault
#macro tby_sound_default_pitch_range  random_range(0.8, 1.2)

#endregion


/* Room options */
#region Room options

/* The name of the layer where textboxy instances are created.
   Should be above all other visible elements.
   Will be created automatically if not present in room. */
#macro tby_room_layer_name "Text"

#endregion


/* Options for inputs, like navigating the choice textbox
   or confirming a dialogue.
   Expressions should evaluate to a boolean. */
#region Input options

#macro tby_input_confirm         (keyboard_check_pressed(\
                                  vk_enter) || \
                                  keyboard_check_pressed(\
								  vk_space))
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


/* Options for all textboxes. */
#region Generic textbox options

/* Image_speed for the textbox confirmation dot. */
#macro tby_generic_blink_speed 1/20

#endregion


/* Options for the normal textbox type. */
#region Normal textbox options

/* The height of a normal textbox in lines. */
#macro tby_normal_lines_per_box        2
/* Which instance should be respected when using
   textbox auto placement. Usually the player.
   Can also be set to noone. */
#macro tby_normal_object_respect_auto objRed

#endregion


/* Options for the textbox bubble type. */
#region Bubble textbox options

/* The maximum width for a given text bubble,
   before a line break is inserted.
   Set to negative for no limit. */
#macro tby_bubble_max_width       120
/* Which character a message box should be prefixed with
   to trigger the bubble type automatically.
   Only one character. */
#macro tby_bubble_quick_mode_char "§"

#endregion


/* Options for tooltips. */
#region Tooltip options

/* The maximum width for a given tooltip,
   before a line break is inserted.
   Set to negative for no limit. */
#macro tby_tooltip_max_width 120

#endregion


/* Options for handling external files. */
#region External lang files

#macro tby_lang_file_use_external     true
/* What external file to use for loading dialogue.
   Must be a .json file added to the included files.*/
#macro tby_lang_file_default_external "lang.json"

#endregion