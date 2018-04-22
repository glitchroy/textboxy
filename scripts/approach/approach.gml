///@function approach(start, ending, difference);
///@param start
///@param ending
///@param difference


var c = argument0;
var t = argument1;
var a = argument2;
if (c < t) {
    c = min(c + a, t);
} else {
    c = max(c - a, t);
}
return c;
