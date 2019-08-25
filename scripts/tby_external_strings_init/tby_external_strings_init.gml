/// @desc Reads value/string pairs from a json file into a global ds_map.
/// @param _lang_file = tby_lang_file_default_external
var _lang_file = argument_count > 0 ? argument[0] : tby_lang_file_default_external;

var _file = file_text_open_read(_lang_file);
var _json_string = "";

while (!file_text_eof(_file)) {
    _json_string += file_text_readln(_file)
}
file_text_close(_file)

_json_string = string_replace_all(_json_string, "\n", "")
_json_string = string_replace_all(_json_string, "\r", "")

var _final_json = json_decode(_json_string);
if (_final_json == -1) {
    tby_log("External loading of string file " + _lang_file + " failed. Maybe the json is invalid?")
} else {
    global.tby_external_strings_map = _final_json
}