/// @param type
/// @param ...
var type = argument[0];

//Args Normal --> Text, Size
//Args Choice --> Text, ChoiceArray, Size
//Args Option --> Type, Args

if (tby_list_exists(tby_branch_get_active_id() )) {
    //part of branch
    var args = []
    for (var i = 0; i < argument_count; i++) {
        args[i] = argument[i]
    }
    
    tby_list_add(tby_branch_get_active_id(), args)
    //queue = global.tby_active_list_name; --unused?
}