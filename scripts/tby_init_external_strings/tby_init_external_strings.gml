/// @param lang_file = tby_default_external_lang_file
var lang_file = argument_count > 0 ? argument[0] : tby_default_external_lang_file;

var file = file_text_open_read(lang_file);
var json_string = "";

while (!file_text_eof(file)) {
    json_string += file_text_readln(file)
}
file_text_close(file)

json_string = string_replace_all(json_string, "\n", "")
json_string = string_replace_all(json_string, "\r", "")

var final_json = json_decode(json_string);
if (final_json == -1) {
    tby_log("External loading of string file " + lang_file + " failed. Maybe the json is invalid?")
} else {
    global.tby_external_strings_map = final_json
}