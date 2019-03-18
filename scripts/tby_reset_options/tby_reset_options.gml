if (global.tby_current_options_map != undefined && ds_exists(global.tby_current_options_map, ds_type_map)) {
    ds_map_clear(global.tby_current_options_map)
} else {
    global.tby_current_options_map = ds_map_create()
}

global.tby_current_options_map[? TbyOption.SetSkin]             = tby_default_skin
global.tby_current_options_map[? TbyOption.SetInstance]         = noone
global.tby_current_options_map[? TbyOption.SetCallback]         = -1
global.tby_current_options_map[? TbyOption.SetPlacement]        = TbyPlacement.Auto
global.tby_current_options_map[? TbyOption.SetWaveSize]         = SCRIBBLE_DEFAULT_WAVE_SIZE     
global.tby_current_options_map[? TbyOption.SetWaveFrequency]    = SCRIBBLE_DEFAULT_WAVE_FREQUENCY
global.tby_current_options_map[? TbyOption.SetWaveSpeed]        = SCRIBBLE_DEFAULT_WAVE_SPEED    
global.tby_current_options_map[? TbyOption.SetShakeSize]        = SCRIBBLE_DEFAULT_SHAKE_SIZE    
global.tby_current_options_map[? TbyOption.SetShakeSpeed]       = SCRIBBLE_DEFAULT_SHAKE_SPEED   
global.tby_current_options_map[? TbyOption.SetRainbowWeight]    = SCRIBBLE_DEFAULT_RAINBOW_WEIGHT