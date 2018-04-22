///@function tbyControlCodeDefaultValue(grid, column)
var grid = argument0;
var c = argument1;

with (tbyTextObject) {
	if (ds_exists(grid, ds_type_grid)) {
		grid[# c, TbyControlCode.Color]	= TbyColor.White;
		grid[# c, TbyControlCode.Font]	= font;
		grid[# c, TbyControlCode.Wait]	= defaultWait;
		grid[# c, TbyControlCode.Jittery] = false;
	}
}