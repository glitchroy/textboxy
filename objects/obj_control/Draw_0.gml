tby_do_draw();

if (tby_debug_mode) {
	var _ds_list_to_string = function(l, _seperator, _truncuate_amount) {
		if (!ds_exists(l, ds_type_list)) return "[]\n";
		if (ds_list_empty(l)) return "[]\n";
		
		var _sb = "[ ";
		
		tby_foreach(l, function(_item, i, _size, _args) {
			if (_args.trunc_amount > 0 && string_length(_item) > _args.trunc_amount) {
				_item = string_copy(_item, 1, _args.trunc_amount);
			}
			_args.sb += string(_item);
			if (i < _size-1) _args.sb += _args.seperator;
			
		}, {sb: _sb, seperator: _seperator, trunc_amount: _truncuate_amount});
		
		_sb += " ]\n";
		return _sb;
	};
	
	var _d = "debug textboxy version " + global.tby.version + "\n";
	_d += "tby.frames_list:\n" + _ds_list_to_string(global.tby.frames_list, ",\n", 4);
	_d += "tby.pause_callbacks_list:\n" + _ds_list_to_string(global.tby.pause_callbacks_list, ",\n", 4)
	tby_debug_draw(0, 0, _d, tby_game_width/2, c_white);
}