///@function tbySetupControlCodes(map)
///@desc map

var map = argument0;
ds_map_clear(map);

map[? TbyControlCode.Color]		= "c";
map[? TbyControlCode.Font]		= "f";
map[? TbyControlCode.Wait]		= ".";
map[? TbyControlCode.Jittery]	= "j";