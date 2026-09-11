import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "../data"
import "../settings"

Item {
  id: focus

  // --- Sizing ---
  implicitWidth: label.implicitWidth
  implicitHeight: label.implicitHeight

  // So it behaves predictably when placed directly in a Layout,
  // without the caller having to set these explicitly.
  Layout.preferredWidth: implicitWidth
  Layout.preferredHeight: implicitHeight

  property int maxWidth: 300

  Text {
    id: label

    elide: Text.ElideRight
    width: Math.min(label.implicitWidth, focus.maxWidth)
    color: Colors.text
    text: Windows.focus
    onTextChanged: fadeAnim.restart()
  }

  SequentialAnimation {
    id: fadeAnim

    NumberAnimation { target: label; property: "opacity"; to: 0; duration: 80 }
    NumberAnimation { target: label; property: "opacity"; to: 1; duration: 120 }
  }
}

