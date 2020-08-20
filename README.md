# textboxy

<p align="center">
  <img src="https://user-images.githubusercontent.com/31043192/90832595-6a5e4400-e346-11ea-982b-10745c5956cf.gif"><br/>
  Twitter: <a href="https://twitter.com/glitchroy" target="_blank">@glitchroy</a>
</p>


`textboxy` is using [scribble by @JujuAdams](https://github.com/JujuAdams/scribble). If you are looking for the old version, please see the [`textboxy-legacy`](https://github.com/glitchroy/textboxy-legacy) repo.

In short, `textboxy` is a **message box management system** for GameMaker Studio 2.3 and up. The goal of `textboxy` is to provide a simple system for RPG-styled message boxes, either as a classic "textbox" (akin to Dragon Quest or Final Fantasy) or a "speech bubble" (something like the Mario & Luigi series). The messages should use a "typing" effect with sound. 

Commands are defined in a simple queue, example are pausing, setting and jumping to labels, changing message box properties and, of course, showing message boxes. Advanced features like flow control using conditionals are also possible.

Features:
- Drop-in solution for RPG styled textbox systems, either as standalone message boxes or "speech bubbles"
- Powerful text system with a lot of built-in effects and control codes, courtesy of [scribble by @JujuAdams](https://github.com/JujuAdams/scribble)
- Easy to understand queue system, modeling the flow of the conversation
- Management of line breaks and distribution of message boxes - you only need to focus on writing the content
- Automatic linking of speech bubbles and speaker objects
- Options to hook into the queue itself via callbacks
- Global config script to manage defaults and input options
- You can define your messages directly in GML, with support for external files planned

Please excuse the lack of documentation or release builds. I'm trying to get to a working release as fast as possible!
