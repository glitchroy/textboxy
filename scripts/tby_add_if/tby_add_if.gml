/// @param _compare_a
/// @param _comparison
/// @param _compare_b
/// @param _if_true
/// @param ?_if_false = undefined
function tby_add_if() {
	var _compare_a = argument[0], _comparison = argument[1], _compare_b = argument[2], _if_true = argument[3];
	var _if_false = argument_count > 4 ? argument[4] : undefined;


	var _key = _tby_branch_conditional_register(
	    _compare_a, _comparison, _compare_b,
	    _if_true,
	    _if_false
	);

	return [TbyCmd.Conditional, _key];


}
