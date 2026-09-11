pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Scope {
  id: bluetooth

  readonly property bool enabled: Bluetooth.defaultAdapter.enabled 
  readonly property bool connected: Bluetooth.defaultAdapter.devices.values.filter(d => d.connected).length

  readonly property string icon: {
    const icons = {
      off: "\udb80\udcb2",
      on: "\udb80\udcaf",
      connected: "\uf293",
    }

    if (bluetooth.connected) {
      return icons.connected
    }

    if (bluetooth.enabled) {
      bluetooth.on
    }

    return icons.off
  }
}

