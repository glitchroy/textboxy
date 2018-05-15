# textboxy

textboy aims to be a simple to use textbox engine for GameMaker Studio 2.

At the moment, it supports
 * Setting speaker instances for automatically updating the textbox position
 * Automatic line breaks based on a maximum width
 * Control codes for color, pauses etc.
 * A global config with customization options without digging into the code at all
 * Basic text sound options

I wanted to keep the features of this engine very simple, so it can be extended upon.  

Some features I'd like to see some day are
  * Support for different fonts
  * Showing sprite icons in messages
  * Loading from .csv files

Thanks for reading!

# Examples
All you really need to get started is something like this

```gml
tbyAddAction(TbyAction.ShowString, "Hello world!");
tbyStart();
```
This shows a textbox with the content "Hello world!" at position 0, 0.  
You can edit all basic parameters in the [`tbyConfig()` script](/scripts/tbyConfig/tbyConfig.gml).

A more advanced setup may involve something like this
```gml
tbyAddAction(TbyAction.SetMaxWidth, 150);
tbyAddAction(TbyAction.SetMaxLines, 4);
tbyAddAction(TbyAction.SetSpeaker, id);
tbyAddAction(TbyAction.SetSpeed, 3);
tbyAddAction(TbyAction.ShowString,
@"This multiline string works by
using a string literal.[...] [j]Crazy[r]!");
tbyAddAction(TbyAction.ShowString, "[c/red]You can also add breaks\nlike this, of course.");
tbyAddAction(TbyAction.SetSpeed, 10);
tbyAddAction(TbyAction.ShowString,
@"[j][c/red]R[c/orange]a[c/yellow]i[c/green]n[c/aqua]b[c/blue]o[c/purple]w[r]!");
tbyStart();
```

# Usage

## Control Codes
The engine provides control codes you can use in your messages.
You can customize the characters in the [`tbyConfig()` script](/scripts/tbyConfig/tbyConfig.gml#L95).
The following control codes are currently supported

| Name | Default identifier | Description | Example |
| --- | --- | --- | --- |
| Color | `c/COLOR` | Sets colors from the [configuration](/scripts/tbyConfig/tbyConfig.gml#L54) | `"[c/blue]I'm blue!"` |
| Wait | `[.]` | Waits [a set number of frames](/scripts/tbyConfig/tbyConfig.gml#L21), can be stacked | `A long[.....] pause.` |
| Jittery | `[j]` | Makes the text jitter | `Are you [j]crazy[r]?!` |
| Skip | `[^]` | Skips to the next action | `Wait,[.] me fini-[..][^]` |
| Reset | `[r]` | Resets to the default values | `"[j][c/red]This is red and jittery. [r]This is neither."` |

## Actions 
As you can see, calling different actions and then executing the action queue is at the heart
of the whole system. The following actions are currently provided

| Script | Description |
| --- | --- |
| `tbyActionSetMaxWidth(maxWidth:Number)` | Sets the maximum width before a line break is automatically inserted. |
| `tbyActionSetMaxLines(maxLines:Number)` | Sets the maximum number of lines in a given messagebox. (In a future version, this should split the message in two single messages, but for now, it just cuts the message off). |
| `tbyActionSetFont(fontResource:Number)` | Sets the font for following messages. |
| `tbyActionSetSpeed(speed:Number` | Sets the speed for following messages. |
| `tbyActionSetOrigin(x:Number, y:Number)` | Sets the messagebox origin (bottom middle of the message box, where the "bubble" sprite is located). |
| `tbyActionSetPosition(x:Number, y:Number)` | Sets the messagebox top-left corner manually. |
| `tbyActionSetPause(frames:Number)` | Inserts a pause of x frames in the action queue. Most useful between messages. |
| `tbyActionSetSpeaker(speakerInstanceId:Number)` | Binds the following messages to a speaker. The message will then follow the speaker instance. Set to `noone` or overwrite with `tbyActionSetOrigin()` or `tbyActionSetPosition()`. |
| `tbyActionShowString(message:String)` | Adds a messagebox. |

These actions should be called by the `tbyAddAction()` script.

There are also some shorthands so you don't have to type as much.
```gml
tby("Testing..."); // adds a ShowString action
tbyPause(60); // adds a SetPause action
tby(id, "This is now following a speaker"); // adds a SetSpeaker action, then a ShowString action
tby("The speaker is now set, so this is still following"); // adds a SetSpeaker action, then a ShowString action
tby(id, 10, "Slower than usual"); // adds a SetSpeaker action, a SetSpeed action and then a ShowString action
tby(noone, "No speaker anymore, but still speed 10");
tbyStart();
```

Finally, as you have seen above, you call `tbyStart()` to begin execution of the action queue.
If you want to reset the dialogue mid-execution, you can call `tbyReset()`.
Imagine some object:
```gml
// CREATE_EVENT
tby("This is an ongoing dialogue...");
tby("Still talking man");
tby("You can take your time with clicking this, you know");
tbyStart();
alarm[0] = 60;

// ALARM_0
tbyReset();
tby("After 60 steps, this box will now show immediately!");
tbyStart();
```

# Credits

Code snippets used:
 - [_spread from gdash by twisterghost](https://github.com/gm-core/gdash/blob/master/src/scripts/_spread/_spread.gml)
