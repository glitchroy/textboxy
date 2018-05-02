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

# Usage
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


Code snippets used:
 - [_spread from gdash by twisterghost](https://github.com/gm-core/gdash/blob/master/src/scripts/_spread/_spread.gml)
