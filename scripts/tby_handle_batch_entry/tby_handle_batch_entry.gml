/// @desc Converts a given array with TbyType commands to a series of TbyBranch instructions and inserts them in the TbyBranch.
/// @param _tb_array
var _tb_array = argument0;

// unfold array and call tby_branch_add accordingly
if (is_array(_tb_array) == false) {
    tby_log("Illegal batch entry, no array");
    exit;
}

for (var i = 0; i < tby_arrlen(_tb_array); i++) {
    var _entry = _tb_array[i];
    
    var _type = _entry[0];
    
    if (_type == TbyType.Batch) continue; //don't handle nested batch
    
    tby_spread(tby_branch_add, _entry)
}

tby_branch_next_entry()