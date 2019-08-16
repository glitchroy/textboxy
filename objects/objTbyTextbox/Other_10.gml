/// @description Faux Create
tby_state_machine_init();

// TbyType.Normal
tby_state_create("Init", tby_st_tb_init)
tby_state_create("Writing", tby_st_tb_writing)
tby_state_create("Waiting", tby_st_tb_waiting)
tby_state_create("Finished", tby_st_tb_finished)
tby_state_create("Vanishing", tby_st_tb_vanishing)

switch(type) {
    case TbyType.Bubble:
        tby_state_create("Init", tby_st_bubble_init)
        tby_state_create("Writing", tby_st_bubble_writing)
        tby_state_create("Waiting", tby_st_bubble_waiting)
        tby_state_create("Finished", tby_st_bubble_finished)
    break;
    case TbyType.Choice:
        tby_state_create("Finished", tby_st_choice_finished);
    break;
}

tby_state_init("Init")