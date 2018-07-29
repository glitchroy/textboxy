for (var i = instance_number(objTextbox)-1; i >= 0; i--) {
    var inst = instance_find(objTextbox, i);
    if (inst != noone && inst.object_index == objTextbox && inst.selectable) return inst;
}

return noone;