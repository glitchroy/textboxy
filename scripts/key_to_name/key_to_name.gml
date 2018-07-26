/// @description Returns the string name for a GameMaker native key index
/// @param key

var _ord = argument0;

if ( _ord >= 33 ) && ( _ord <= 126 ) {
    var _string = chr( _ord );
    if ( string_length( _string ) == 1 ) return _string;
}

switch( _ord ) {
    
    case vk_escape:    return "ESCAPE";        break;
    case vk_shift:     return "SHIFT";         break;
    case vk_enter:     return "ENTER";         break;
    case vk_control:   return "CONTROL";       break;
    case vk_alt:       return "ALT";           break;
    case vk_tab:       return "TAB";           break;
    case vk_backspace: return "BACKSPACE";     break;
    case vk_space:     return "SPACE";         break;
                                                
    case vk_lalt:      return "LEFT_ALT";      break;
    case vk_lcontrol:  return "LEFT_CONTROL";  break;
    case vk_ralt:      return "RIGHT_ALT";     break;
    case vk_rcontrol:  return "RIGHT_CONTROL"; break;
                                                
    case vk_delete:    return "DELETE";        break;
    case vk_insert:    return "INSERT";        break;
    case vk_end:       return "END";           break;
    case vk_home:      return "HOME";          break;
    case vk_pagedown:  return "PAGE_DOWN";     break;
    case vk_pageup:    return "PAGE_UP";       break;
                                                
    case vk_up:        return "UP";            break;
    case vk_down:      return "DOWN";          break;
    case vk_left:      return "LEFT";          break;
    case vk_right:     return "RIGHT";         break;
                                                
    case vk_numpad0:   return "NUMPAD_0";      break;
    case vk_numpad1:   return "NUMPAD_1";      break;
    case vk_numpad2:   return "NUMPAD_2";      break;
    case vk_numpad3:   return "NUMPAD_3";      break;
    case vk_numpad4:   return "NUMPAD_4";      break;
    case vk_numpad5:   return "NUMPAD_5";      break;
    case vk_numpad6:   return "NUMPAD_6";      break;
    case vk_numpad7:   return "NUMPAD_7";      break;
    case vk_numpad8:   return "NUMPAD_8";      break;
    case vk_numpad9:   return "NUMPAD_9";      break;
                                                
    case vk_add:       return "NUMPAD_+";      break;
    case vk_subtract:  return "NUMPAD_-";      break;
    case vk_divide:    return "NUMPAD_/";      break;
    case vk_multiply:  return "NUMPAD_*";      break;
    
    default:
        return "";
    break;
    
}