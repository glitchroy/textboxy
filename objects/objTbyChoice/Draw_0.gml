event_inherited();

var textDim/*:TbyPos*/ = tby_array_clone(pos)

// Choices
if (stateName == "Finished") {
    var arrow = tby_array_get(tby_branch_get_option(global.tby_active_branch, TbyOption.SetSkin), TbySkin.Arrow);

    var heightOffset = tby_pos_height_from_lines(choiceFirstLine + selectedChoice)
    
    draw_sprite(arrow, -1, textDim[TbyPos.x]+3, textDim[TbyPos.y]+heightOffset+2)

}

#region Debug
if (global.tby_debug) {
    var padding = tby_tile_size;
    var boxDim = [textDim[TbyPos.x]-padding, textDim[TbyPos.y]-padding, textDim[TbyPos.x]+textDim[TbyPos.width]+padding, textDim[TbyPos.y]+textDim[TbyPos.height]+padding]

    var choice = -1;
    if (variable_instance_exists(id, "selectedChoice")) choice = selectedChoice;
    tby_draw_debug(boxDim[2]-80, boxDim[1]-padding-5, "Selected choice: " + string(choice));
}
#endregion