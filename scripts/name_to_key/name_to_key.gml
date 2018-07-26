/// @description Returns the GameMaker native key index for a string name
/// @param name

var _string = string_upper( argument0 );

if ( string_length( _string ) == 1 ) {
    var _ord = ord( _string );
    if ( _ord >= 33 ) && ( _ord <= 126 ) return _ord else return undefined;
}

switch( _string ) {
    
    case "ESCAPE":        return vk_escape;    break;
    case "ESC":           return vk_escape;    break;
    case "SHIFT":         return vk_shift;     break;
    case "RETURN":        return vk_enter;     break;
    case "ENTER":         return vk_enter;     break;
    case "CONTROL":       return vk_control;   break;
    case "CTRL":          return vk_control;   break;
    case "ALT":           return vk_alt;       break;
    case "TAB":           return vk_tab;       break;
    case "BACKSPACE":     return vk_backspace; break;
    case "SPACE":         return vk_space;     break;
    
    case "LEFT_ALT":      return vk_lalt;      break;
    case "LEFT_CONTROL":  return vk_lcontrol;  break;
    case "LEFT_CTRL":     return vk_lcontrol;  break;
    case "RIGHT_ALT":     return vk_ralt;      break;
    case "RIGHT_CONTROL": return vk_rcontrol;  break;
    case "RIGHT_CTRL":    return vk_rcontrol;  break;
    
    case "DELETE":        return vk_delete;    break;
    case "INSERT":        return vk_insert;    break;
    case "END":           return vk_end;       break;
    case "HOME":          return vk_home;      break;
    case "PAGE_DOWN":     return vk_pagedown;  break;
    case "PAGE_UP":       return vk_pageup;    break;
    
    case "UP":            return vk_up;        break;
    case "DOWN":          return vk_down;      break;
    case "LEFT":          return vk_left;      break;
    case "RIGHT":         return vk_right;     break;
    
    case "NUMPAD0":       return vk_numpad0;   break;
    case "NUMPAD1":       return vk_numpad1;   break;
    case "NUMPAD2":       return vk_numpad2;   break;
    case "NUMPAD3":       return vk_numpad3;   break;
    case "NUMPAD4":       return vk_numpad4;   break;
    case "NUMPAD5":       return vk_numpad5;   break;
    case "NUMPAD6":       return vk_numpad6;   break;
    case "NUMPAD7":       return vk_numpad7;   break;
    case "NUMPAD8":       return vk_numpad8;   break;
    case "NUMPAD9":       return vk_numpad9;   break;
    
    case "NUMPAD_0":      return vk_numpad0;   break;
    case "NUMPAD_1":      return vk_numpad1;   break;
    case "NUMPAD_2":      return vk_numpad2;   break;
    case "NUMPAD_3":      return vk_numpad3;   break;
    case "NUMPAD_4":      return vk_numpad4;   break;
    case "NUMPAD_5":      return vk_numpad5;   break;
    case "NUMPAD_6":      return vk_numpad6;   break;
    case "NUMPAD_7":      return vk_numpad7;   break;
    case "NUMPAD_8":      return vk_numpad8;   break;
    case "NUMPAD_9":      return vk_numpad9;   break;
    
    case "NUMPAD_+":        return vk_add;       break;
    case "NUMPAD+":         return vk_add;       break;
    case "NUMPAD_ADD":      return vk_add;       break;
    case "NUMPAD_PLUS":     return vk_add;       break;
    
    case "NUMPAD_-":        return vk_subtract;  break;
    case "NUMPAD-":         return vk_subtract;  break;
    case "NUMPAD_SUBTRACT": return vk_subtract;  break;
    case "NUMPAD_MINUS":    return vk_subtract;  break;
    
    case "NUMPAD_/":        return vk_divide;    break;
    case "NUMPAD/":         return vk_divide;    break;
    case "NUMPAD_DIVIDE":   return vk_divide;    break;
    
    case "NUMPAD_*":        return vk_multiply;  break;
    case "NUMPAD*":         return vk_multiply;  break;
    case "NUMPAD_MULTIPLY": return vk_multiply;  break;
    
    default:
        return undefined;
    break;
    
}