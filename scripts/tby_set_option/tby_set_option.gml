/// @param args
var args = argument0;

if (global.tbyCurrentOptionsMap == undefined || !ds_exists(global.tbyCurrentOptionsMap, ds_type_map)) {
    global.tbyCurrentOptionsMap = ds_map_create()
}

//args[0] is always TbyType.Option
switch (args[1]) {
    case TbyOption.SetShake:    global.tbyCurrentOptionsMap[? TbyOption.SetShake]    = args[2]; break;
    case TbyOption.SetWave:     global.tbyCurrentOptionsMap[? TbyOption.SetWave]     = args[2]; break;
    case TbyOption.SetInstance: global.tbyCurrentOptionsMap[? TbyOption.SetInstance] = args[2]; break;
}

tby_queue_next_entry()