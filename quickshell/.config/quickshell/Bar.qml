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
        left: Sizes.xs
        right: Sizes.xs
      }

      implicitHeight: 30
      color: Colors.transparent

      Item {
        anchors.fill: parent

        RowLayout {
          id: left
          anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
          }

          Pill {
            Text {
              text: "test"
              color: Colors.text
            }
          }
        }

        RowLayout {
          id: center
          anchors {
            centerIn: parent
          }

          Pill {
            FocusWindowWidget {}
          }
        }

        RowLayout {
          id: right
          anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
          }

          Pill {
            TrayWidget {}
          }

          Pill {
            RowLayout {
              BluetoothWidget {
                color: Colors.text
              }
              WifiWidget {
                color: Colors.text
              }
            }
          }

          Pill {
            RowLayout {
              CPUWidget {
                color: Colors.text
              }
              RAMWidget {
                color: Colors.text
              }
              BatteryWidget {
                color: Colors.text
                font.bold: true
              }
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

