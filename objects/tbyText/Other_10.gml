/// @description Initialize everything
ccGrid = ds_grid_create(string_length(cleanText),
						TbyControlCode._SIZE);
var ccMap = -1;
ds_grid_clear(ccGrid, undefined);

#region Create cc map
for (var i = 0; i < string_length(dirtyText); i++) {
	//add the character and default values
	ccGrid[# i, 0] = string_copy(cleanText, i+1, 1);
	if (ccGrid[# i, TbyControlCode.Wait] == undefined) {
		ccGrid[# i, TbyControlCode.Wait] = wait;
	}
	
	//check dirty character
	var dirtyChar = string_char_at(dirtyText, i+1);
	if (dirtyChar == tbyControlCodeOpening) {
		//control code found at i+1
		var ccBegin = i+1;
		
		// get string between the codes
		var ccEnd = ccBegin;
		for (var j = i; j <= string_length(dirtyText); j++) {
			if (string_char_at(dirtyText, j) == tbyControlCodeClosing) {
				ccEnd = j;
				i--;
				break;
			};
		}
		
		var code = string_copy(dirtyText, ccBegin+1, ccEnd-ccBegin-1);
		//strip code
		dirtyText = string_delete(dirtyText, ccBegin, ccEnd-ccBegin+1);
		
		if (is_string(code) && string_length(code) > 0) {
			//Is the code valid? Check if a valid character comes after
			ccMap = ds_map_create();
			tbyGetControlCodes(ccMap);
	
			var check = ds_map_find_value(ccMap,
						string_char_at(code, 1));

			if (!is_undefined(check)) {
				// valid code, first character matches
				// check now holds the type of code
				var data = true;
				if (string_length(code) > 1 || check == TbyControlCode.Wait) {
					// we have additional data like color id
					data = string_delete(code, 1, 1);
					switch (check) {
						case TbyControlCode.Color:
							data = tbyTranslateColor(real(data));
						break;
						case TbyControlCode.Wait:
							data = (string_length(data)+1)*tbyWaitStepsPerWait;
							//error("WAITING SETUP", data);
						break;
					}
				}
				
				if (check != TbyControlCode.Reset) {
					//Apply data
					var index = i+1;
					//timing one char before
					if (check == TbyControlCode.Wait ||
						check == TbyControlCode.Skip) {
						index-=2;
					}
					ccGrid[# index, check] = data;
				} else {
					//Reset column
					tbyControlCodeDefaultValue(ccGrid, i+1);
				}
			}
		}
		
	}
}
#endregion

if (ds_exists(ccMap, ds_type_map)) {
	ds_map_destroy(ccMap);
}

#region extend every row but wait
//start at second row, first row is unaffected
for (var h = 1; h < ds_grid_height(ccGrid); h++) {
	if (h == TbyControlCode.Wait) continue; //skip waits
	
	var lastValIndex = -1;
	for (var rowIndex = 0; rowIndex < ds_grid_width(ccGrid); rowIndex++) {
		var val = ccGrid[# rowIndex, h];
		if (val != undefined) {
			//manually inserted, so it should be extended
			if (rowIndex+1 < ds_grid_width(ccGrid) &&
				ccGrid[# rowIndex+1, h] == undefined) {

				//overwrite next value if its undefined
				ccGrid[# rowIndex+1, h] = val;
			}
		}
	}
}
#endregion

running = true;
alarm[0] = 1;