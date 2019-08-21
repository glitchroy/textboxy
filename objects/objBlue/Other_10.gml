/// @description Message code
//tby_load("custom.identifier.test")

var _test_var = ["haha", TbyPlacement.Top]

var _blue_dialogue = tby_branch_create([
        "test1",
        _test_var, // Declared array
        tby_branch_wait(1),
        tby_branch_config(TbyConfig.Placement, TbyPlacement.Middle),
        "test2",
        [TbyType.Config, TbyConfig.Instance, objBlue], // alternative TbyBranch.config()
        tby_branch_if(
            5, TbyCondition.Equals, 5, 
            [
                ["haha its true", TbyPlacement.Middle],
                [TbyType.Wait, 1], // alternative for TbyBranch.wait()
                "no way lol",
                tby_branch_if(
                    objRed.x, TbyCondition.SmallerThan, objBlue.x,
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
/*
TbyBranch.add("[pause,0.5]testing test[pause,0.5]ing");
TbyBranch.add(TbyType.GoTo, "label-2");
TbyBranch.add(TbyType.Bubble, "I like your color!", id)
TbyBranch.add(TbyType.Bubble,
"It's very[pause,0.2].[pause,0.2].[pause,0.2].[pause,0.2] [c_red]red[].",
id)
TbyBranch.add(TbyType.Wait, 1) // time in seconds
TbyBranch.add(TbyType.Label, "label-2");
TbyBranch.add(TbyType.Bubble, "Thanks!", instance_find(objRed, 0));
TbyBranch.add(TbyType.Bubble, "Yep.[pause,0.2]\nThat's about it.", id)
TbyBranch.add(TbyType.Choice, "Test", ["yes", "no"])
*/
//TbyBranch.add("[c_aqua](You feel like you just made a [wave][rainbow]new friend[][c_aqua]!)");