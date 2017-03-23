# haxe-gif2
Fork of haxe-gif, made some modification to fit my project, will eventually do a pull-request.

Fix:
- Better Cross-platform support
- "Streaming", decoding frame as needed and not all at once
- Getting rid of most OpenFL dependencies (while still supporting OpenFL of course!)

Samples included for PixiJS, OpenFL and Flash.

GifDisplay is using one single Texture for each frame.
GifDisplay2 is using multiple textures one of top of each other.

Need some refactoring and cleaning but should be good to works.