/// @description Message code
tby_load("custom.identifier.test")





/*
new TbyBranch("blue-dialogue");

TbyBranch.use("blue-dialogue");
TbyBranch.add(TbyType.Bubble, "I like your color!", id)
TbyBranch.add(TbyType.Bubble,
"It's very[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2].[ev|wait|0.2] [c_red]red[].",
id)
TbyBranch.add(TbyType.Wait, 1) // time in seconds
TbyBranch.add(TbyType.Bubble, "Thanks!", instance_find(objRed, 0));
TbyBranch.add(TbyType.Bubble, "Yep.[ev|wait|0.2]\nThat's about it.", id)
TbyBranch.add("[c_aqua](You feel like you just made a [wave][rainbow]new friend[][c_aqua]!)");

TbyBranch.run("blue-dialogue")