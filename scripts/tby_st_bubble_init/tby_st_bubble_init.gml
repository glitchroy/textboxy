// Init basics
textSpeed = SCRIBBLE_DEFAULT_TYPEWRITER_SPEED;
waitTimer = 0;
pos = 0;
sizeClamped = false;

// Calculate position
var tbWidth = tby_max_width_bubble;

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
                               tbWidth,
                               tby_default_color,
                               tby_default_font,
                               fa_left,
                               dataFields);


var padding = tby_tile_size;
var box = scribble_get_box(textScribble, 0, 0); // just for relative width / height
pos = tby_pos_create_bubble(inst, tby_scribble_get_box_width(box), tby_scribble_get_box_height(box))

//Add camera offset
//Calc max size (the custom box width if specified or the whole game screen)
var cam = view_camera[0]
if (cam != -1) {
    var padding = tby_tile_size;
    var posi/*:TbyPos*/ = self.pos;
    posi[@TbyPos.x] = camera_get_view_x(cam) + posi[TbyPos.x] + padding;
    posi[@TbyPos.y] = camera_get_view_y(cam) + posi[TbyPos.y] + padding;
}

//message confirmation dot speed
image_speed = tby_confirmation_blink_speed;

//set origin point of box to topleft
scribble_set_box_alignment(textScribble); 

//set fade in to 0 to begin with
scribble_typewriter_in(textScribble, SCRIBBLE_TYPEWRITER_PER_CHARACTER, textSpeed);

//Adjust position optionally
if (inst != undefined && instance_exists(inst)) {
    tby_bubble_update_position(inst);
    tby_bubble_clamp_position()
}


tby_state_switch("Writing")