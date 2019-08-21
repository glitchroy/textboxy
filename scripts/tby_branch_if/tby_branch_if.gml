/// @param _compare_a
/// @param _comparison
/// @param _compare_b
/// @param _if_true
/// @param ?_if_false = undefined
var _compare_a = argument[0], _comparison = argument[1], _compare_b = argument[2], _if_true = argument[3];
var _if_false = argument_count > 4 ? argument[4] : undefined;

var _result = false;

switch (_comparison) {
    case TbyCondition.Equals:
        _result = _compare_a == _compare_b;
    break;
    case TbyCondition.BiggerThan:
        _result = _compare_a > _compare_b;
    break;
    case TbyCondition.SmallerThan:
        _result = _compare_a < _compare_b;
    break;
    case TbyCondition.NotEquals:
        _result = _compare_a != _compare_b;
    break;
}

if (_result) return _if_true
return _if_false