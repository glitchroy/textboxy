//Confirmation
if (selectable && selected) {
    if (manInput.confirm) {
        instance_destroy();
        var next = textbox_find_next_selectable();
        if (next != noone) next.selected = true;
    }
}