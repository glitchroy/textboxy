#macro inherit event_inherited()
#macro singleton if (instance_number(object_index)>1) {instance_destroy();}

#macro gameWidth 640
#macro gameHeight 360

//For states
#macro STEP_EVENT event_type == ev_step
#macro DRAW_EVENT event_type == ev_draw
#macro DRAW_GUI_EVENT event_type == ev_draw && event_number = ev_gui

#macro tm_pixel tilemap_get_at_pixel
#macro arr_length array_length_1d
#macro is_parent object_is_ancestor

#macro layerText "Text"
#macro layerManagers "Managers"

enum TBSize {
    x,
    y,
    width,
    height,
    margin,
    sizeof
}