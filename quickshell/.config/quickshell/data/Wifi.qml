pragma Singleton

import Quickshell
import Quickshell.Networking

Scope {
  id: wifi

  readonly property var device: {
    for (const d of Networking.devices.values) {
      if (d.type === DeviceType.Wifi) return d
    }
    return null
  }

  readonly property var network: {
    if (!wifi.device) return null

    for (const n of wifi.device.networks.values) {
      if (n.connected) return n
    }

    return null
  }

  readonly property string ssid: wifi.network ? wifi.network.name : ""

  readonly property double strength: wifi.network ? wifi.network.signalStrength : 0

  readonly property bool connected: wifi.network !== null

  readonly property string icon: {
    const icons = {
      not_connected: "\udb82\udd2d",
      low: "\udb82\udd1f",
      medium: "\udb82\udd22",
      high: "\udb82\udd25",
      full: "\udb82\udd28"
    }

    if (!wifi.connected) return icons.not_connected
   
    const s = wifi.strength

    if (s < 0.25) return icons.low
    if (s < 0.50) return icons.medium
    if (s < 0.75) return icons.high

    return icons.full
  }
}
