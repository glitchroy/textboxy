event_inherited();

tby_state_create("Init", tby_st_bubble_init)
tby_state_create("Writing", tby_st_bubble_writing)
tby_state_create("Waiting", tby_st_bubble_waiting)
tby_state_create("Finished", tby_st_bubble_finished)
tby_state_init("Init")