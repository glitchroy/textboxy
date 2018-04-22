/// @description Initialize everything
ccGrid = ds_grid_create(string_length(text),
						TbyControlCode._SIZE);
ds_grid_clear(ccGrid, undefined);

// initialize string
for (var i = 0; i < string_length(text); i++) {
	ccGrid[# i, 0] = string_copy(text, i+1, 1);
}

running = true;