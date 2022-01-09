import unicode, vmath, pixwindy/common

export common, unicode, vmath

when defined(windows):
  import pixwindy/platforms/win32/platform
elif defined(macosx):
  import pixwindy/platforms/macos/platform
elif defined(linux):
  import pixwindy/platforms/linux/platform

export platform
