import Quickshell
import QtQuick
import QtQuick.Layouts
import "../settings"

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 40
  color: "transparent"

  RowLayout {
    anchors {
      fill: parent
      margins: 0
    }

    spacing: 0


    Rectangle {
      Layout.topMargin: Sizes.sm
      Layout.rightMargin: Sizes.sm
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

      implicitWidth: 100
      implicitHeight: 30
      radius: Sizes.md
      color: Colors.base

      Text {
        anchors.centerIn: parent
        text: "Hello"
        font {
          family: Fonts.family
          pixelSize: Fonts.fontSize
        }
        color: Colors.text
      }
    }
  }
}
