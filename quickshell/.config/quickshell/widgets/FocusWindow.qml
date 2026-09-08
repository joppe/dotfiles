import QtQuick
import Quickshell.Wayland
import "../settings"

Text {
  elide: Text.ElideRight
  color: Colors.text
  text: {
    for (const tl of ToplevelManager.toplevels.values) {
      if (tl.activated) return tl.title
    }
    return "No focused window"
  }
}
