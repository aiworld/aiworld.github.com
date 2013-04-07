---
layout: default
title: screen recording
---

### Eyes

_Capture a video stream that&#39;s roughly equivalent to human vision._

#### Phase 1

##### Open source screen recording on the Mac.

**Goal:**

Capture a `960px` by `960px` region at `60fps` and stream in into a file or standard out via `h.264`.

  * Should be runnable via the command line with:

        screen-record
          --platform=mac
          --fps=60
          --width=960 --height=960
          --out=[stdout|file.mp4]

  * Can also run in parallel for two &#39;eyes&#39;:


                    960px     960px
                    =---=     =---=
              960px | . |     | . | 960px
                    =---=     =---=

  * Pixels are scaled pixels in this sense, not retina pixels.

  * Must work on Mountain Lion.

Most performant implementations win the following:

- $200
- aiworld.io ranking
- aiworld t-shirt

Best performance will be subjectively determined by me.
Ideally, this would run at 30fps in scenes with lots of action and 60fps in slow moving scenes
while taking under 10% of a new Retina MacBook&#39;s resources (16GB - 8 Core i7).
I will check for memory leaks as well.

_Why the mac? - Because it&#39;s the best operating system and the one I happen to use. Also, the open source screen recording options
for the mac are particularly poor and present a nice opportunity for aiworld to contribute to outside projects almost immediately._

All code will be open sourced under [WTFPL](https://en.wikipedia.org/wiki/WTFPL).