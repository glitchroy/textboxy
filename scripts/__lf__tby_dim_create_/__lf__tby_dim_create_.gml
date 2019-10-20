/// __lf__tby_dim_create_(_placement, _height)
//!#lambda$ ($)
var _placement = argument0, _height = argument1;
 {
            switch (_placement) {
                case TbyPlacement.Top: return 0; break;
                case TbyPlacement.Middle: return tby_game_height/2 - _height/2; break;
                case TbyPlacement.Bottom: return tby_game_height - _height; break;
                case TbyPlacement.Auto:
                    // Figure out placement
                    var _i = tby_game_object_respect_auto;
                    if (_i == noone) return 0;

                    var _iy = _tby_dim_gui_y(_i.y);
                    
                    // Assign Top or Bot
                    return (_iy > tby_game_height/2) ? 0 : tby_game_height - _height;
                break;
            }
        }