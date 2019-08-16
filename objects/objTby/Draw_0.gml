if (is_array(tooltips)) {
    for (var i = 0; i < tby_arrlen(tooltips); i++) {
        var _p = tooltips[@ i];
        if (_p != undefined) {
            tby_tooltip_draw(_p[0], _p[1], _p[2]);
        }
    }
    tooltips = 0;
}