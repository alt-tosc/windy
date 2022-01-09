import unittest
import pixwindy, pixie

let window = newWindow("Simple window", ivec2(1280, 800))

var image = newImage(1280, 800)

proc display =
  image.fill color(1, 1, 1, 1)
  window.draw image

window.onResize = proc =
  if window.size.x * window.size.y == 0: return
  image = newImage(window.size.x, window.size.y)
  display()

display()

while not window.closeRequested:
  pollEvents()
