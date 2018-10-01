if (instance_exists(inst)) {
    tby_tb_update_position(inst);
    tby_tb_clamp_position()
}

if (selectable && selected) tby_state_switch_previous()