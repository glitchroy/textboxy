#macro tby_default_skin [sprTbySkinFrameA, sprTbySkinBubbleA, sprTbySkinPauseA]
#macro tby_default_color c_black

#macro tby_default_text_speed 1

#macro tby_confirmation_blink_speed 1/20
#macro tby_default_font "sprTbyFontMain"

#macro tby_default_shake_intensity 1.2
#macro tby_default_wave_intensity 2.0

#macro tby_default_speech_sound sndTbySpeechDefault
#macro tby_default_pitch_range irandom_range(0.8, 1.2)

#macro tby_layer_text "Text"

#macro tby_input_confirm (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter))
#macro tby_input_choice_up (keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_up))
#macro tby_input_choice_down (keyboard_check_pressed(ord("K")) || keyboard_check_pressed(vk_down))