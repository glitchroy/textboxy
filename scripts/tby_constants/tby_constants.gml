#macro singleton if (instance_number(object_index)>1) {instance_destroy();}

#macro gameWidth 640
#macro gameHeight 360

#macro tby_array_len array_length_1d

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