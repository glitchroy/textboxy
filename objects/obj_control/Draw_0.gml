tby_do_draw();

if (tby_debug) {
	var _ds_list_to_string = function(l, _seperator, _truncuate_amount) {
		if (!ds_exists(l, ds_type_list)) return "[]\n";
		if (ds_list_empty(l)) return "[]\n";
		
		var _r = "[ ";
		var _size =ds_list_size(l);
		for (var i = 0; i < _size; i++) {
			var _item = string(l[| i]);
			if (_truncuate_amount > 0 && string_length(_item) > _truncuate_amount) {
				_item = string_copy(_item, 1, _truncuate_amount);
			}
			
			_r += string(_item);
			if (i < _size-1) _r += _seperator;
		}
		_r += " ]\n";
		return _r;
	}
	
	var _d = "debug textboxy version " + tby_version + "\n";
	_d += "tby_frames_list:\n" + _ds_list_to_string(global.tby_frames_list, ",\n", 4);
	_d += "tby_pause_callbacks_list:\n" + _ds_list_to_string(global.tby_pause_callbacks_list, ",\n", 4)
	tby_debug_draw(0, 0, _d, tby_game_width/2);
}