

blue_dialogue = tby_branch_create([
        tby_add_bubble("Haha.[pause,1]test", id),
        tby_add_box("lol"),
        tby_add_choice("choice 1 or 2", "Choice 1", "Choice 2",
            [
                "You chose choice 1",
                tby_add_pause(1),
                "Wise."
            ],
            [
                "You chose choice 2",
                "That's cool and all"
            ]
        ),
        tby_add_config(TbyConfig.Placement, TbyPlacement.Middle),
        ["§test2", id],
        
        tby_add_config(TbyConfig.Instance, instance_find(objBlue, 0)),
        tby_add_if(
            5, TbyCondition.Equals, 5, 
            [
                tby_add_box("haha its true", TbyPlacement.Middle),
                tby_add_pause(1), // alternative for TbyBranch.wait()
                "no way lol",
                tby_add_if(
                    tby_pointer("x", objRed), TbyCondition.SmallerThan, tby_pointer("x", objBlue),
                    [
                        "you are standing left",
                        "hm yes"
                    ],
                    "you are standing right"
                )
            ],
            "false hmm" // This would be an optional else
        ),
        "§yo" // Single string doesn't need an array
    ]);

test = tby_branch_create([
    tby_add_if(
        tby_pointer("x", id), TbyCondition.Equals, tby_pointer("x", objRed),
        [
            "true"
        ],
        [
            "fals"
        ]
    )
    ]);