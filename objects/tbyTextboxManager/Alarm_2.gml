/// @description Reset wait tick

if (delayedStart) tbyManagerStart;
error(instance_find(tbyText, 0));
delayedStart = false;