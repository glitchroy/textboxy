/* This config file is meant to last through updates. */
/* Also check */__scribble_config()/* for additional config options. */

/* Basic game information */
#macro tby_game_width 480
#macro tby_game_height 270

/* Basic text options */
#macro tby_default_skin [sprTbySkinFrameD, sprTbySkinBubbleD, sprTbySkinPauseD, sprTbySkinArrowD]
#macro tby_default_color c_white
#macro tby_default_font "sprTbyFontMain"

/* Sound options */
#macro tby_default_speech_sound sndTbySpeechDefault
#macro tby_default_pitch_range random_range(0.8, 1.2)

/* Map options */
#macro tby_layer_text "Text"

/* Input options */
#macro tby_input_confirm (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
#macro tby_input_choice_up (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("A")))
#macro tby_input_choice_down (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("D")))
#macro tby_input_advance_textbox (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))

/* General textbox options */
#macro tby_confirmation_blink_speed 1/20
#macro tby_object_respect_auto_placement objRed //Usually the player

/* Bubble textbox options */
#macro tby_max_width_bubble 120
#macro tby_quick_mode_bubble_char "§"

/* Technical */
#macro tby_texture_page_size 2048

/* External lang files */
#macro tby_use_external_lang_file true
#macro tby_default_external_lang_file "lang.json"
