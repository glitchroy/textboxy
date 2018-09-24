/// @function stateMachineInit()
/// @description [Create Event] Initilize the variables required for the state engine.

state		= noone;
stateNext	= state;
stateName	= "Unknown";
stateTimer	= 0;
stateMap	= ds_map_create();
stateKeys	= ds_map_create(); //The inverse map of the state map.
stateStack	= ds_stack_create();
stateNew	= true;
stateVar[0]	= 0; //Useful for storing variables specific to a specific state.
statePrevious = noone;

//Add any new variables you might need for your game here.
stateCanInterrupt = true;

//Good examples might be
//stateCanInterrupt = false;
//stateIsInvincible = false;
//stateDirection = -1;