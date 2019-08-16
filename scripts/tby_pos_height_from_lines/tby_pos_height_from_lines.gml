/// @desc Returns height based on standard line height and the amount of lines given.
/// @param _lines
var _lines = argument0;

return _lines * scribble_get_glyph_property(tby_default_font, " ", SCRIBBLE_GLYPH.HEIGHT)