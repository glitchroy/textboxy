#macro tby_singleton if (instance_number(object_index)>1) {instance_destroy();}

#macro tby_version "1.0.0-pre.1"

#macro tby_game_width 640
#macro tby_game_height 360

#macro tby_tile_size sprite_get_width(tby_array_get(tby_default_skin, TbySkin.Frame))

#macro tby_arrlen array_length_1d

#macro tby_object_manager objTby
#macro tby_object_textbox objTbyTb
#macro tby_object_choice objTbyChoice

enum TbySize {
    x,
    y,
    width,
    height,
    margin,
    sizeof
}

enum TbyType {
    Normal,
    Choice,
    Condition
}

enum TbySkin {
    Frame,
    Bubble,
    Pause
}

enum TbyFrame {
    TopLeft, TopMid, TopRight,
    MidLeft, Mid, MidRight,
    BotLeft, BotMid, BotRight
}