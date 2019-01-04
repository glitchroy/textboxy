/// @description Message code

tby_branch_create("blue-dialogue");
tby_branch_use("blue-dialogue");
tby_branch_add(TbyType.Bubble, "I like your color!", id)
tby_branch_add(TbyType.Bubble,
"It's very[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2] [c_red]red[].",
id)
tby_branch_add(TbyType.Wait, 1) // time in seconds
tby_branch_add(TbyType.Bubble, "Thanks!", instance_find(objRed, 0));
tby_branch_add(TbyType.Bubble, "Yep.[ev|wait|0.2]\nThat's about it.", id)
tby_branch_add("[c_aqua](You feel like you just made a [wave][rainbow]new friend[][c_aqua]!)");
tby_branch_run("blue-dialogue")