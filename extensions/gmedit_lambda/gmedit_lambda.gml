#define __lf_
// https://bugs.yoyogames.com/view.php?id=29984
#define __lf_tby_get_global_box_position_calculate_auto_position
/// __lf_tby_get_global_box_position_calculate_auto_position()
//!#lambda calculate_auto_position
 {
    var playerInst = instance_find(tby_object_respect_auto_placement, 0);
    if (playerInst == noone) return tby_box_size_bottom;
    
    var camY = 0;
    var cam = view_camera[0];
    if (cam != -1) {
        camY = camera_get_view_y(cam)
    }
    
    var playerY = playerInst.y - camY;
    
    if (playerY > tby_game_height/2) {
        return tby_box_size_top;
    } else {
        return tby_box_size_bottom;
    }
}
#define __lf_tby_normal_get_placement_from_enum_calculate_auto_position
/// __lf_tby_normal_get_placement_from_enum_calculate_auto_position(pos_top, pos_bot)
//!#lambda calculate_auto_position($)
var pos_top = argument0, pos_bot = argument1;
 {
    var playerInst = instance_find(tby_object_respect_auto_placement, 0);
    if (playerInst == noone) return pos_bot;
    
    var camY = 0;
    var cam = view_camera[0];
    if (cam != -1) {
        camY = camera_get_view_y(cam)
    }
    
    var playerY = playerInst.y - camY;
    
    if (playerY > tby_game_height/2) {
        return pos_top;
    } else {
        return pos_bot;
    }
}
#define __lf_entity_get_interaction_box_get_offset
/// __lf_entity_get_interaction_box_get_offset(dir)
//!#lambda get_offset($)
var dir = argument0;
 {
    if (dir = EntityDir.Left || dir = EntityDir.Right) return 90;
    return 180;
}