///@function tbyM()
///@desc Returns the current instance of the manager object or creates a new one

var inst = instance_find(tbyManagerObject, 0);

if inst == noone return tbyCreateManagerSnippet
return inst;