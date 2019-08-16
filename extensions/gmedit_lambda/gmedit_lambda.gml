#define __lf_
// https://bugs.yoyogames.com/view.php?id=29984
#define __lf_tby_normal_get_placement_from_enum_calculate_auto_position
/// __lf_tby_normal_get_placement_from_enum_calculate_auto_position(_pos_top, _pos_bot)
//!#lambda calculate_auto_position($)
var _pos_top = argument0, _pos_bot = argument1;
 {
    var _player_inst = instance_find(tby_object_respect_auto_placement, 0);
    if (_player_inst == noone) return _pos_bot;
    
    var _cam_y = 0;
    var _cam = view_camera[0];
    if (_cam != -1) {
        _cam_y = camera_get_view_y(_cam)
    }
    
    var _player_y = _player_inst.y - _cam_y;
    
    if (_player_y > tby_game_height/2) {
        return _pos_top;
    } else {
        return _pos_bot;
    }
}