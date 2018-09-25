#region Scribble
if ( array_length_1d( SCRIBBLE_FONT_ARRAY ) ) scribble_load_fonts( SCRIBBLE_FONT_ARRAY );
__scribble_additional_init_commands();
#endregion

global.tbyQueueMap = ds_map_create();