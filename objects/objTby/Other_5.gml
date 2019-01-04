tby_branch_reset_map()
global.tby_active_list_name = undefined;
tby_reset_options()

if (global.tby_finished_lists_list == undefined) {
    global.tby_finished_lists_list = ds_list_create()
}
if (ds_exists(global.tby_finished_lists_list, ds_type_list) && ds_list_size(global.tby_finished_lists_list) > 0) {
    ds_list_clear(global.tby_finished_lists_list)
}