# textboxy scribble

> This project is a new version of textboxy, using the [scribble](https://github.com/GameMakerDiscord/scribble/) engine (v2.4.0) by @jujuadams.  
A small example is included. Please note that this version is not yet ready and considered a preview build or beta.  
The documentation is being worked on in the wiki.
**Current version: `v1.0.0-pre.4`**

> textboxy is built using [GMEdit](https://yellowafterlife.itch.io/gmedit) and best viewed through it, as namespacing and lambda previews will make navigating the codebase a lot more comfortable.

<p align="center">

<a href="https://twitter.com/glitchroy">Twitter</a> | <a href="https://marketplace.yoyogames.com/assets/6934/textboxy-engine">Marketplace</a>
</p>

textboxy aims to be a simple to use textbox engine for GameMaker Studio 2. 

## Features
- A global config script to adjust the engines inner workings without having to dig into the code at all
- A very robust and fast backend text engine, utilizing vertex buffers and shaders automatically
- Automatic and smart line breaks
- Use text boxes with automatic placement or text bubbles tied to an instance
- Simple and efficient queue system for writing dialogue
- A ton of different text effects (color change, wavy text, shaking text...)
- Basic flow control for dialogue trees (choice evaluation, jump to labels...)
- Easily create your own custom skins or use one of the defaults
- Basic sound options
- Text message hooks for features such as pausing during dialogues

## Explanation and concepts
textboxy classifies one or more related textboxes as a `TbyBranch`. A `TbyBranch` has to be created and selected. After that, any number of different `TbyType`s can be added, e.g. a `TbyType.Normal` (normal textbox), `TbyType.Bubble` (text bubble), `TbyType.Wait` (wait command), `TbyType.Choice` (choice textbox) or even `TbyType.Terminate` (immediate cancellation of current executed branch).  
You can also set a `TbyType.Option` for the current `TbyBranch`, e.g. a callback, the wave or shake intensity or the talking instance for a text bubble.

After adding as many `TbyType`s as desired, a `TbyBranch` can be run and will be executed. A branch does not have to executed right after creation, but can instead be stored and ran any time after that, as many times as desired, for the current room.

For a full list of examples and documentation, please refer to the wiki

## Basic usage examples
### A basic textbox
```gml
tby_branch_create("event");
tby_branch_use("event");
tby_branch_add(TbyType.Normal, "This is a basic textbox.");

tby_branch_run("event");
```

<details>
 <summary>Special note: Using GMEdit, special namespaces are available, condensing the above code down to this (expand me)</summary>
```gml
new TbyBranch("event");
TbyBranch.use("event");
TbyBranch.add(TbyType.Normal, "This is a basic textbox.");
TbyBranch.run("event")
```
</details>

### A basic dialogue
Assuming instances `objRedBall` and `objGreenBall`.
```gml
tby_branch_create("ball-dialogue");
tby_branch_add(TbyType.Bubble, "I am a red ball!", objRedBall);
tby_branch_add(TbyType.Bubble, "I am red, and also a ball", objRedBall);
tby_branch_add(TbyType.Bubble, "Red is my favorite color.", objRedBall);
tby_branch_add(TbyType.Bubble, "Ha, I am a green ball!", objGreenBall);
tby_branch_add(TbyType.Bubble, "WE ARE TALKING!!", objRedBall);

tby_branch_run("ball-dialogue");
```

#### A basic dialogue with shorthand notation
Using common shorthands (see the wiki), you can condense this dialogue down to the following:
```
tby_branch_create("ball-dialogue-short");
tby_branch_set(TbyOption.SetInstance, objRedBall); // Set using the options instead of every message
tby_branch_add("§I am a red ball!");
tby_branch_add("§I am red, and also a ball");
tby_branch_add("§Red is my favorite color.");
tby_branch_add("§Ha, I am a green ball!", objGreenBall);
tby_branch_add("§WE ARE TALKING!!", objRedBall);
```

### A basic choice
```
tby_branch_create("choice");
tby_branch_use("choice");
tby_branch_add(TbyType.Choice, "(Hmm, what do I choose?)", ["The red shoes!", "The green shoes!"]);
//TbyType.ChoiceResult can contain any other nested TbyType
tby_branch_add(TbyType.ChoiceResult, 0, TbyType.Normal, "You chose the red."); // Long form
tby_branch_add(TbyType.ChoiceResult, 1, "You chose the green."); // Shorthand

tby_branch_run("choice");
```
