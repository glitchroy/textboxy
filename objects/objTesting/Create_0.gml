//technical
position = 0
waiting = false;
finished = false;

//visual
smoothness = 0;



textRaw = @"You bloody wot,[ev|wait|0.2] [rainbow]mate[/rainbow]?!
[ev|wait|0.3]lolllllll"

text = scribble_create(textRaw, gameWidth-100,"sprFontMain",
						   fa_left, c_white, 0);

//set origin point of box to middle
scribble_set_box_alignment( text, fa_center, fa_middle );

//set fade in to 0 to begin with
scribble_set_char_fade_direct(text, 0, smoothness);