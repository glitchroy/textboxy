# textboxy

textboxy aims to be a simple to use textbox engine for GameMaker Studio 2.

## Features

* A global [config script](/scripts/tbyConfig/tbyConfig.gml) to adjust the engine without having to dig into the code at all
* Control codes for changing text properties like color, speed, font, pauses, as well as position and size of the message box
* Automatic line breaks based on a maximum width and special characters like whitespace and commas
* Easy linking between message boxes and "speaker" instances, automatically updating the message box position
* Basic options for text sound

Some more features I'd like to add are
* Support for different fonts in one message box
* Showing icons in text
* Loading from .csv files
* Answer options

# Explanation

At its core, textboxy utilizes an `action queue`. You queue up different actions like showing strings, changing the position or speed and then execute them all in order.  
The strings themselves can be modified using `control codes` to adjust color, pauses and other effects.  

A really basic queue would look like this:
```gml
tbyAddAction(TbyAction.SetPosition, 100, 100);
tbyAddAction(TbyAction.ShowString, "Hello world!");
tbyStart();
```
This would show a message box with the words "Hello world" at position 100, 100 (top-left corner of the message box).  
You can see all available actions below.

# Usage

## Actions
<table>
  <tr>
    <th>Definition</th>
    <th>Description</th>
    <th>Example</th>
  </tr>
  <tr>
    <td><pre lang="gml">SetMaxWidth(maxWidth:Number)</pre></td>
    <td>Sets the maximum width before a line break is automatically inserted.</td>
    <td>
<pre lang="gml">
// Sets the maximum width
// before a line break to 150 pixels
tbyAddAction(TbyAction.SetMaxWidth, 150);</pre>
</td>
  </tr>
  <tr>
    <td><pre lang="gml">SetMaxLines(maxLines:Number)</pre></td>
    <td>Sets the maximum number of lines in a given message box.<br />(In a future version, this should split the message in two single messages, but for now, it just cuts the message off).</td>
    <td>
<pre lang="gml">
// Message boxes are now
// at most two lines long
tbyAddAction(TbyAction.SetMaxLines, 2);</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">SetFont(fontResource:Number)</pre></td>
    <td>Sets the font for following messages.</td>
    <td>
<pre lang="gml">
// Changes the font to fontBig
tbyAddAction(TbyAction.SetFont, fontBig);</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">SetSpeed(speed:Number)</pre></td>
    <td>Sets the speed for following messages.</td>
    <td>
<pre lang="gml">
// Sets the speed to 5, meaning 5 steps
// pausing between drawing each character
tbyAddAction(TbyAction.SetSpeed, 5);</pre>
    </td>
  </tr>
  <tr>
    <td>
<pre lang="gml">
SetOrigin(x:Number, 
          y:Number)</pre>
    </td>
    <td>Sets the message box origin (bottom middle of the message box, where the "bubble" sprite is located).</td>
    <td>
<pre lang="gml">
// The following messages will be drawn
// with their origin at 100, 100
tbyAddAction(TbyAction.SetOrigin,
             100, 100);</pre>
    </td>
  </tr>
  <tr>
    <td>
<pre lang="gml">
SetPosition(x:Number, 
            y:Number)</pre>
    </td>
    <td>Sets the message box top-left corner manually.</td>
    <td>
<pre lang="gml">
// The following messages will be drawn
// with their top-left corner at 10, 10
tbyAddAction(TbyAction.SetPosition,
             10, 10);</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">SetPause(frames:Number)</pre></td>
    <td>Inserts a pause of x frames in the action queue. Most useful between messages.</td>
    <td>
<pre lang="gml">
// Pauses for one second before executing
// the next action in the queue
tbyAddAction(TbyAction.SetPause,
             room_speed);</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">SetSpeaker(instId:Number)</pre></td>
    <td>Binds the following messages to a speaker. The message will then follow the speaker instance. To reset, set to <tt>noone</tt> or overwrite with <tt>tbyActionSetOrigin()</tt> or <tt>tbyActionSetPosition()</tt>.</td>
    <td>
<pre lang="gml">
// Sets the instance referenced 
// in global.player as the speaker
tbyAddAction(TbyAction.SetSpeaker,
             global.player);</pre>
    </td>
  </tr>
  <tr>
    <td>
<pre lang="gml">ShowString(message:String)</pre>
    </td>
    <td>Adds a message box.</td>
    <td>
<pre lang="gml">
// Display the message box
tbyAddAction(TbyAction.ShowString,
             "[j]Crazy!!!");</pre>
    </td>
  </tr>
  <tr>
    <th><b>Shorthand</b></th>
    <th></th>
    <th></th>
  </tr>
  <tr>
    <td>
<pre lang="gml">
tby(&lt;optional&gt;instId:Number,
    &lt;optional&gt;speed:Number,
    message:String)</pre>
    </td>
    <td>Shortcut to set a common message.</td>
    <td>
<pre lang="gml">
// Sets speaker, speed and string
tby(id, 4, "First");
// Speaker and string carry over
tby("Second");
// Removes the speaker, speed is still 4
tby(noone, "Third");
// To adjust speed,
// speaker must be specified
tby(noone, 1, "Fourth");</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">tbyPause(frames:Number)</pre></td>
    <td></pre>Shortcut for setting a pause</pre></td>
    <td>
<pre lang="gml">
// Add a half second pause
tbyPause(room_speed/2);</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">tbyStart()</pre></td>
    <td>Starts execution of the current action queue</td>
    <td>
<pre lang="gml">
tby("Hello");
...
tbyStart(); // Execution starts now</pre>
    </td>
  </tr>
  <tr>
    <td><pre lang="gml">tbyReset()</pre></td>
    <td>Resets the textbox manager and removes any text instances</td>
    <td>
<pre lang="gml">
tby("This will never be seen");
tbyReset();
tby("But this will!");
tbyStart();</pre>
    </td>
  </tr>
</table>

## Control Codes
You can customize the identifiers in the [`tbyConfig()` script](/scripts/tbyConfig/tbyConfig.gml#L104).

| Name | Default identifier | Description | Example |
| --- | --- | --- | --- |
| Color | `[c/COLOR]` | Sets colors from the [configuration](/scripts/tbyConfig/tbyConfig.gml#L101) | `"[c/blue]I'm blue!"` |
| Wait | `[.]` | Waits [a set number of frames](/scripts/tbyConfig/tbyConfig.gml#L21), can be stacked | `A long[.....] pause.` |
| Jittery | `[j]` | Makes the text jitter | `Are you [j]crazy[r]?!` |
| Skip | `[^]` | Skips to the next action | `Wait,[.] let me fini-[..][^]` |
| Reset | `[r]` | Resets to the default values | `"[j][c/red]This is red and jittery.[.] [r]This is neither.[.] [c/blue]This is blue."` |

# Examples

## String literals
Game Maker Studio 2 supports `string literals` with `@"string"`.  
Using these, you can define line breaks without having to type `\n`.
```gml
//Both of these produce the same output
tby(id, "Hello\nWorld!");

tby(id,
@"Hello
World!");
```

## Basic dialogue
Assuming the instances `player` and `oldMan`.
```gml
var oldManSpeed = 6;
var playerSpeed = tbyWaitAfterEachChar; //this is the default speed defined in tbyConfig()

tby(player, playerSpeed,
@"Hello,[.] old man.[..]
Do you know where I can find the [c/red]hidden treasure[r]?");
tby(oldMan, oldManSpeed,
@"[j]Oooohhhhh[r],[.] it is the [c/red]hidden treasure[r]
you seek?[.] Good luck finding it,[.]
nobody knows where it is[.].[.].[.].");
tby(player, playerSpeed,
@"You have to know something!")
tbyPause(room_speed/2); //Half a second
tby("Please?") //speaker and speed carry over
tby(oldMan, oldManSpeed,
@"[j]OoooooOooohhh[r],[.] I am telling you,[.] no o-[...][^]")
tby(player, playerSpeed,
@"I get it,[.] you are no help either.");

tbyStart();
```

## Resetting the queue
```gml
// CREATE_EVENT
tby("This is an ongoing dialogue...");
tby("Still talking, man");
tby("You can take your time with advancing this, you know");
tbyStart();
alarm[0] = 60;

// ALARM_0
tbyReset();
tby(
@"After 60 steps, this box will now appear immediately,
even if something else was showing before!");
tbyStart();
```

# Credits

Code snippets used:
 - [_spread from gdash by twisterghost](https://github.com/gm-core/gdash/blob/master/src/scripts/_spread/_spread.gml)
