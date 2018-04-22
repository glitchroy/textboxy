///@function tbyGetControlCodes(map)
///@desc map

var map = argument0;
ds_map_clear(map);

map[? "r"] = TbyControlCode.Reset;
map[? "c"] = TbyControlCode.Color;
map[? "f"] = TbyControlCode.Font;
map[? "."] = TbyControlCode.Wait;
map[? "j"] = TbyControlCode.Jittery;