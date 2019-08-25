/// @desc Returns height based on standard line height and the amount of lines given.
/// @param _lines
gml_pragma("forceinline");
return argument0 * scribble_get_glyph_property(tby_default_font, " ", SCRIBBLE_GLYPH.HEIGHT)