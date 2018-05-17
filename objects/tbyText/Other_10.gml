/// @description Initialize everything

// TODO: See if this dirty hack can be removed
/* Adding a space ensures that a trailing
control code gets processed, too */ 
cleanText = cleanText+" ";
dirtyText = dirtyText+" ";

ccGrid = ds_grid_create(string_length(cleanText),
						TbyCode._SIZE);

ds_grid_clear(ccGrid, undefined);
var ccMap = tbyArrayToMap(tbyControlIdentifiers);
var colors = tbyArrayToMap(tbyColorNames);

#region Create ControlCode Grid
/* At the end of this loop, we want a grid
of every character and the corresponding codes
for every index.
*/
var si;
var i;
for (i = 0; i < string_length(cleanText); i++) {
	si = i+1; //string index - strings start at 1
	
	// Put our clean char in the grid to begin with
	ccGrid[# i, 0] = string_copy(cleanText, si, 1);
	// Initialize our default time if we don't have any set yet
	if (ccGrid[# i, TbyCode.Wait] == undefined) {
		ccGrid[# i, TbyCode.Wait] = wait;
	}
	
	#region Check for control codes
	var dirtyChar = string_char_at(dirtyText, si);

	if (dirtyChar != tbyControlCodeOpening) continue;
		
	// We found a control code opening at si
	var ccBegin = si;
	// We want the whole content of the control code
	// If we encounter another opening char before
	// or no end char at all, this code is invalid
	#region Strip out whole control code
	var skip = string_count(tbyControlCodeClosing, dirtyText);
	
	var j;
	if (skip > 0) {
		// Loop through all characters starting from the
		// one after this opening (that's why its ccBegin+1)
		for (j = ccBegin+1; j < string_length(dirtyText); j++) {
			var c = string_char_at(dirtyText, j);
			
			if (c == tbyControlCodeOpening) {
				skip = true;
				break;
			}
			if (c == tbyControlCodeClosing) {
				skip = false;
				break;
			}
		}
	}
	
	if (skip) continue;
	#endregion
	
	// Found end successfully
	var ccEnd = j;
	var ccCodeLength = ccEnd-(ccBegin-1) //remove 1 indexing
	
	//+1 so we start after the opening char and -2 so we only take the inner string
	var ccCode = string_copy(dirtyText, ccBegin+1, ccCodeLength-2);

	// Delete this code out (+1 so we delete the ending char too)
	dirtyText = string_delete(dirtyText, ccBegin, ccCodeLength);
	
	#region Process the code
	if !is_string(ccCode) continue;
	if (string_length(ccCode) <= 0) continue; // fail cases
			
	// Check if the first character of the control code
	// is in the reference map
	var codeCheck = ccMap[? string_char_at(ccCode, 1)];
	
	if (is_undefined(codeCheck)) continue; //if not, it's an invalid code
	
	/* We want to figure out the control code data
	for the specific code */
	var data = true; //default case is just true
	
	#region Specific code behaviour
	if (codeCheck == TbyCode.Reset) {
		/* Reset Code is a special case. We just reset the
		current column and continue. The script below
		handles the rest */
		tbyControlCodeDefaultValue(ccGrid, i);
		continue;
	}
	
	// This is the big control code character switch statement
	// (Lots of alliterations!)
	switch (codeCheck) {
		case TbyCode.Color:
			/* Color expects the delimiter and a string after
			For simplicity's sake, we assume the color string
			starts at index 3.
			This means that the color identifier and delimiter
			both need to be 1 string long.*/
			// TODO: Maybe get the string the correct way
			var colorIdentifier = string_copy(ccCode, 3,
											  string_length(ccCode)-3+1);
			var colorValue = colors[? colorIdentifier]
			
			if (colorValue != undefined) {
				data = colorValue;
			}
			
		break;
		case TbyCode.Wait:
			/* Wait expects a number of steps to wait.
			This works by counting the number of characters
			in the code */
			data = tbyWaitAfterEachChar + (tbyWaitPerWaitChar * string_length(ccCode))
		break;
		// Jittery is fine with the default true
	}
	#endregion
	
	ccGrid[# i, codeCheck] = data;

	#endregion
			
	#endregion
	
	// If we got to this point, a control code was
	// processed. We check the same char again
	// to account for control codes back to back
	// We limit to -1 because we increase +1 anyway next loop
	i = max(-1, i-1)
} // end for-loop
#endregion

#region Clean-Up
// Destroy maps again
if (ds_exists(ccMap, ds_type_map)) {
	ds_map_destroy(ccMap);
}
if (ds_exists(colors, ds_type_map)) {
	ds_map_destroy(colors);
}
#endregion

#region Extend rows where it is needed
for (var row = 1; row < ds_grid_height(ccGrid); row++) {
	// We start at 1, because the first row is
	// just the character itself
	
	/* We loop through the grid vertically.
	Some codes like color and jittery extend
	until they are reset or overwritten. This
	is accomplished here, on a per-row basis. */
	
	// We don't need to extend these codes
	if (row == TbyCode.Wait ||
		row == TbyCode.Skip) {
		continue;
	}
	
	for (var col = 0; col < ds_grid_width(ccGrid); col++) {
		// Loop through every column in the row
		var val = ccGrid[# col, row];
		
		// If a value is not undefined, that means
		// it has been changed manually and should be
		// considered when extending
		if (val == undefined) continue;
		// Check if this is not the last value
		if (col+1 >= ds_grid_width(ccGrid)) continue;
		
		// Get the next entry, which will be modified
		// to match the current one
		var valNext = ccGrid[# col+1, row]
		
		// Check if the next value should be considered
		if (valNext != undefined) continue;
		
		// Overwrite the next value
		ccGrid[# col+1, row] = val;
	}
}
#endregion

running = true;
alarm[0] = 1;