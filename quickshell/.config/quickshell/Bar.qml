import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import "./settings"

Scope {
  id: root

  property string time

  function batteryPercentage() {
    return `${UPower.displayDevice.percentage * 100}%`
  }

  Variants {
    // this is a reactive property, will be updated when screen is added/removed
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30
      color: Colors.base

      RowLayout {
        anchors {
          right: parent.right
          rightMargin: Sizes.md
          verticalCenter: parent.verticalCenter
        }

        Text {
          readonly property string percentage: {
            return `bat: ${UPower.displayDevice.percentage * 100}%`
          }
          text: percentage
          color: Colors.text
        }

        ClockWidget {
          color: Colors.text
          font.bold: true
        }
      }
    }
  }
}

