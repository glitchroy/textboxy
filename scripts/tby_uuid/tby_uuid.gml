/// @desc Returns a random UUID.
// https://forum.yoyogames.com/index.php?threads/generate-guid.17518/#post-112199
var _r = "";
for (var i = 0; i < 32; i++) {
    if (i == 8 || i == 12 || i == 16 || i == 20) _r += "-";
    _r += choose("0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "A", "B", "C", "D", "E", "F");
}
return _r;