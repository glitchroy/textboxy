/// @param _text
/// @param _choice_a
/// @param _choice_b
/// @param _option_a
/// @param _option_b
/// @param ?_placement = undefined
var _text = argument[0], _choice_a = argument[1], _choice_b = argument[2], _option_a = argument[3], _option_b = argument[4];
var _placement = argument_count > 5 ? argument[5] : undefined;

return [
        [TbyType.Choice, _text, _choice_a, _choice_b, _placement],
        tby_branch_if(tby_pointer("tby_choice_result"), TbyCondition.Equals, 0, _option_a, _option_b)
    ]