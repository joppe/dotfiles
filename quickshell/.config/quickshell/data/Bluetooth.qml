pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Scope {
  id: bluetooth

  readonly property bool enabled: Bluetooth.defaultAdapter.enabled 
  readonly property bool connected: {
    const connected = Bluetooth.defaultAdapter.devices.values.filter((d) => {
      return d.connected;
    });

    return connected.length > 0;    
  }

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
      return icons.on
    }

    return icons.off
  }
}

