/// @description Message code
//tby_load("custom.identifier.test")

var _test_var = ["haha", TbyPlacement.Top]

var _blue_dialogue = tby_branch_create([
        tby_branch_normal("HAha"),
        _test_var, // Declared array
        tby_branch_choice("choice 1 or 2", "Choice 1", "Choice 2",
            [
                "You chose choice 1",
                tby_branch_wait(1),
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
                [TbyCmd.Wait, 1], // alternative for TbyBranch.wait()
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

tby_branch_run(_blue_dialogue)