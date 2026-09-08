pragma Singleton

import Quickshell
import Quickshell.Wayland

Scope {
  id: windows

  readonly property string focus: {
    for (const tl of ToplevelManager.toplevels.values) {
      if (tl.activated) return tl.title
    }
    return "No focused window"
  }
}

