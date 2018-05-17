///@function tbyControlCodeDefaultValue(grid, column)
///@desc Fills the given column with default values for all control codes
///@param grid
///@param column or x coordinate

var grid = argument0;
var col = argument1;

//sanity check
if (!instance_exists(tbyTextObject)) return -1;

with (tbyTextObject) {
	if (ds_exists(grid, ds_type_grid)) {
		grid[# col, TbyCode.Color]		= tbyDefaultColor;
		grid[# col, TbyCode.Wait]		= wait;
		grid[# col, TbyCode.Jittery]	= false;
	}
}