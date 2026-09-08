import QtQuick
import "../data"
import "../settings"

Text {
  id: focus

  property int maxWidth: 300

  elide: Text.ElideRight
  width: Math.min(focus.implicitWidth, focus.maxWidth)
  color: Colors.text
  text: Windows.focus
}
