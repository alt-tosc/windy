import unittest
import pixwindy, pixie

test "simple window":
  let window = newWindow("simple window", ivec2(1280, 800))

  var image = newImage(1280, 800)

  proc display =
    image.fill color(1, 1, 1, 1)
    window.draw image

  window.onResize = proc =
    if window.size.x * window.size.y == 0: return
    image = newImage(window.size.x, window.size.y)
    display()

  window.onButtonRelease = proc(button: Button) =
    case button
    of KeyEscape: close window
    of KeyF1, MouseLeft: window.fullscreen = not window.fullscreen
    of KeyF2: window.maximized = not window.maximized
    else: discard

  display()

  while not window.closeRequested:
    pollEvents()

test "draw":
  let window = newWindow("draw", ivec2(1280, 800))

  var image = newImage(1280, 800)

  proc display =
    image.fill color(1, 1, 1, 1)
    let r = image.newContext

    r.fillStyle = rgb(100, 100, 255)
    r.fillRoundedRect rect(window.size.vec2 / 2 - vec2(100, 100), vec2(200, 200)), 7.5

    window.draw image

  window.onResize = proc =
    if window.size.x * window.size.y == 0: return
    image = newImage(window.size.x, window.size.y)
    display()

  window.onButtonRelease = proc(button: Button) =
    case button
    of KeyEscape: close window
    of KeyF1, MouseLeft: window.fullscreen = not window.fullscreen
    of KeyF2: window.maximized = not window.maximized
    else: discard

  display()

  while not window.closeRequested:
    pollEvents()
