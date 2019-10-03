blue_dialogue = tby_branch_create([
        tby_branch_bubble("Haha.test", id),
        tby_branch_box("lol"),
        tby_branch_choice("choice 1 or 2", "Choice 1", "Choice 2",
            [
                "You chose choice 1",
                tby_branch_pause(1),
                "Wise."
            ],
            [
                "You chose choice 2",
                "That's cool and all"
            ]
        ),
        tby_branch_config(TbyConfig.Placement, TbyPlacement.Middle),
        "test2",
        
        [TbyCmd.Config, TbyConfig.Instance, objBlue], // alternative TbyBranch.config()
        
        tby_branch_if(
            5, TbyCondition.Equals, 5, 
            [
                ["haha its true", TbyPlacement.Middle],
                [TbyCmd.Pause, 1], // alternative for TbyBranch.wait()
                "no way lol",
                tby_branch_if(
                    tby_pointer("x", objRed), TbyCondition.SmallerThan, tby_pointer("x", objBlue),
                    [
                        ["you are standing left"],
                        ["hm yes"]
                    ],
                    ["you are standing right"]
                )
            ],
            ["false hmm"] // This would be an optional else
        ),
        "§yo" // Single string doesn't need an array
    ]);

_speed_test = tby_branch_create([
    "[shake]Normal speed[]. [pause,1][speed,0.05]This is speed slow. [pause,1][speed,2]This is speed 2. [pause,1][speed,10]This is speed 10. [wait][speed,0.3]Back to normal."
]);