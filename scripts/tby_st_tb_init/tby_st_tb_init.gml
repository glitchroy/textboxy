// Init basics
textSpeed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
waitTimer = 0;
var pos/*:TbyPos*/ = self.pos

//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var cam = view_camera[0]
if (cam != -1) {
    var padding = tby_tile_size;
    pos[@TbyPos.x] += camera_get_view_x(cam);
    pos[@TbyPos.y] += camera_get_view_y(cam);
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

var branchName = global.tby_active_branch;
var dataFields = [
    tby_branch_get_option(branchName, TbyOption.SetWaveSize),
    tby_branch_get_option(branchName, TbyOption.SetWaveFrequency),
    tby_branch_get_option(branchName, TbyOption.SetWaveSpeed),
    tby_branch_get_option(branchName, TbyOption.SetShakeSize),
    tby_branch_get_option(branchName, TbyOption.SetShakeSpeed),
    tby_branch_get_option(branchName, TbyOption.SetRainbowWeight),
]

textScribble = scribble_create(textRaw,
                               -1,
                               pos[TbyPos.width],
                               tby_default_color,
                               tby_default_font,
                               fa_left,
                               dataFields);

//set origin point of box to topleft
scribble_set_box_alignment(textScribble); 

scribble_typewriter_in(textScribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, textSpeed);

tby_state_switch("Writing")