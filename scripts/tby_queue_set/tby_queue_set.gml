/// @param option
/// @param ...
var option = argument[0];

// Wrapper for queue_add that already specifies TbyType.Option

var args = []
for (var i = 0; i < argument_count; i++) {
    args[i] = argument[i]
}

tby_queue_add(TbyType.Option, args)