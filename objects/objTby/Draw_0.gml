if (is_array(tooltips)) {
    for (var i = 0; i < tby_arrlen(tooltips); i++) {
        var p = tooltips[@ i];
        if (p != undefined) {
            tby_tooltip_draw(p[0], p[1], p[2]);
        }
    }
    tooltips = 0;
}