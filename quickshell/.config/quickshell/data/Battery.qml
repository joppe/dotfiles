pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Scope {
  id: battery

  readonly property string percentage: {
    return `bat: ${UPower.displayDevice.percentage * 100}%`
  }
}

