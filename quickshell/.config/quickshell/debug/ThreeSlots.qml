import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  RowLayout {
   anchors.fill: parent

        // Left Part
        Text {
            text: "Left"
            Layout.alignment: Qt.AlignLeft
        }

        // Center Part
        Text {
            text: "Center"
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
        }

        // Right Part
        Text {
            text: "Right"
            Layout.alignment: Qt.AlignRight
        }
    }
}
