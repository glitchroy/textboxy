// https://forum.yoyogames.com/index.php?threads/generate-guid.17518/#post-112199
var r = "";
for (var i = 0; i < 32; i++) {
    if (i == 8 || i == 12 || i == 16 || i == 20) r += "-";
    r += choose("0", "1", "2", "3", "4", "5", "6", "7",
        "8", "9", "A", "B", "C", "D", "E", "F");
}
return r;