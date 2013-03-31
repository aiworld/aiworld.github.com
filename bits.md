---
layout: default
title: bits
---

Bits - getting down to the dirty details
---------------------------------------------------

### Platform
Player's machine running Unity game
                 |
                 |(multiplayer stream pipe)
                 |
                 |-> Brain machine with the same game and different cameras
                     Cameras get screen captured and sent to brain process.
                     Since brain process just takes a h.264 stream and sends back some actions,
                       it can be written in any language, YAY!!!




