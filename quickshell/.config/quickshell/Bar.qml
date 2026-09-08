import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import "./pill"
import "./settings"
import "./widgets"

Scope {
  id: bar

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

      margins {
        top: Sizes.md
      }

      implicitHeight: 30
      color: Colors.transparent

      RowLayout {
        anchors {
          fill: parent
        }

        RowLayout {
          Layout.alignment: Qt.AlignLeft 

          Pill {
            Text {
              text: "test"
            }
          }
        }

        RowLayout {
          Layout.alignment: Qt.AlignHCenter 
          Layout.fillWidth: true

          Pill {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            FocusWindow {}
          }
        }

        RowLayout {
          Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

          Pill {
            BatteryWidget {
              color: Colors.text
              font.bold: true
            }
          }

          Pill {
            ClockWidget {
              color: Colors.text
              font.bold: true
            }
          }
        }
      }
    }
  }
}

