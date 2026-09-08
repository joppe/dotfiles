import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../settings"

RowLayout {
  id: tray

  property int iconSize: Sizes.lg

  spacing: Sizes.sm

  Repeater {
    model: SystemTray.items

    Image {
      required property SystemTrayItem modelData

      Layout.preferredWidth: tray.iconSize
      Layout.preferredHeight: tray.iconSize

      source: modelData.icon
    }
  }
}

