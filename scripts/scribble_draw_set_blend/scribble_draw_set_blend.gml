/// Sets Scribble's colour and alpha blending state.
/// 
/// 
/// @param colour   The blend colour used when drawing text, applied multiplicatively.
/// @param alpha    The alpha used when drawing text, 0 being fully transparent and 1 being fully opaque.
/// 
/// 
/// The blend colour/alpha is applied at the end of the drawing pipeline. This is a little different to the interaction
/// between draw_set_colour() and draw_text*(). Scribble's blend colour is instead similar to draw_sprite_ext()'s
/// behaviour: The blend colour/alpha is applied multiplicatively with the source colour, in this case the source colour
/// is whatever colour has been set using formatting tags in the input text string.
/// 
/// This script "sets state". All text drawn with scribble_draw() will use these settings until they're overwritten,
/// either by calling this script again or by calling scribble_draw_reset() / scribble_draw_set_state().

global.scribble_state_colour = argument0;
global.scribble_state_alpha  = argument1;
