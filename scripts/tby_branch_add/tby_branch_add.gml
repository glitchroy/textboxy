/// @param type
/// @param ...
var type = argument[0];

//Args Normal --> Text, Size
//Args Choice --> Text, ChoiceArray, Size
//Args Option --> Type, Args

if (tby_branch_exists(global.tby_active_branch)) {
    //part of branch
    var args = []
    for (var i = 0; i < argument_count; i++) {
        args[i] = argument[i]
    }
    
    tby_branch_add_to_message_list(global.tby_active_branch, args)
}