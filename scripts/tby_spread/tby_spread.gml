/// @_func tby_spread(script, argsArray)
/// @desc Runs a script with the provided array as arguments
/// @param {Script} script The script to run
/// @param {Array} arrayOfArguments An array to provide as individual arguments
/// @return {*} The return value of the script
/*
@example
tby_spread(add_to_list, [listId, 1, 2, 3, 4]);
// => List now contains 1, 2, 3, 4
*/

//by https://github.com/gm-core/gdash/blob/master/src/scripts/_spread/_spread.gml

var _func = argument[0];

if (is_undefined(argument[1])) {
    return script_execute(_func);
} 

var _args = argument[1];
switch (array_length_1d(_args)) {
  case 1:
    return script_execute(_func, _args[@ 0]);
  case 2:
    return script_execute(_func, _args[@ 0], _args[@ 1]);
  case 3:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2]);
  case 4:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3]);
  case 5:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4]);
  case 6:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5]);
  case 7:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6]);
  case 8:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7]);
  case 9:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8]);
  case 10:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9]);
  case 11:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10]);
  case 12:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11]);
  case 13:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12]);
  case 14:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12], _args[@ 13]);
  case 15:
    return script_execute(_func, _args[@ 0], _args[@ 1], _args[@ 2], _args[@ 3], _args[@ 4], _args[@ 5], _args[@ 6], _args[@ 7], _args[@ 8], _args[@ 9], _args[@ 10], _args[@ 11], _args[@ 12], _args[@ 13], _args[@ 14]);
}



