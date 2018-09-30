if (global.tbyCurrentOptionsMap != undefined && ds_exists(global.tbyCurrentOptionsMap, ds_type_map)) {
    ds_map_clear(global.tbyCurrentOptionsMap)
} else {
    global.tbyCurrentOptionsMap = ds_map_create()
}

global.tbyCurrentOptionsMap[? TbyOption.SetShake] = tby_default_shake_intensity
global.tbyCurrentOptionsMap[? TbyOption.SetWave] = tby_default_wave_intensity
global.tbyCurrentOptionsMap[? TbyOption.SetPosition] = [TbyPosition.Custom, 0, 0]
