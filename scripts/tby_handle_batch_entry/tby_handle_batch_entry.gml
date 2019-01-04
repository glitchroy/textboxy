/// @param tbArray
var tbArray = argument0;

// unfold array and call tby_branch_add accordingly
if (is_array(tbArray) == false) {
    tby_log("Illegal batch entry, no array");
    exit;
}

for (var i = 0; i < tby_arrlen(tbArray); i++) {
    var entry = tbArray[i];
    
    var type = entry[0];
    
    if (type == TbyType.Batch) continue; //don't handle nested batch
    
    tby_spread(tby_branch_add, entry)
}

tby_branch_next_entry()