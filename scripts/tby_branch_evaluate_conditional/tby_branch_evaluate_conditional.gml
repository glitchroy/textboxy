/// @param _key
var _key = argument0;

var _conditional = global.tby_conditions[? _key];
if (_conditional == undefined) exit;

var _compare_a  = _conditional[0];
var _comparison = _conditional[1];
var _compare_b  = _conditional[2];
var _if_true    = _conditional[3];
var _if_false   = _conditional[4];

// Check for pointers
if (is_array(_compare_a) && _compare_a[TbyPointerMeta.IdentifierString] == "TBY_POINTER") {
    _compare_a = tby_pointer_apply(_compare_a)
}
if (is_array(_compare_b) && _compare_b[TbyPointerMeta.IdentifierString] == "TBY_POINTER") {
    _compare_b = tby_pointer_apply(_compare_b)
}

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

if (_result) {
    return _if_true
}
return _if_false