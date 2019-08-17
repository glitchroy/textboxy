script_execute(tby_st_normal_writing);

// Check instance position
if (inst != undefined && instance_exists(inst)) {
    tby_bubble_update_position(inst);
    tby_bubble_clamp_position()
}