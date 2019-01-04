event_inherited();

var textDim/*:TbyPos*/ = tby_array_clone(pos)

// Choices
if (stateName == "Finished") {
    var arrow = tby_array_get(tby_default_skin, TbySkin.Arrow);

    var heightOffset = tby_pos_height_from_lines(choiceFirstLine + selectedChoice)
    
    draw_sprite(arrow, -1, textDim[TbyPos.x]+3, textDim[TbyPos.y]+heightOffset+2)

}