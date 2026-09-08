pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Scope {
  id: battery

  readonly property string icon: {
    const charging = [
      "\udb82\udc9f",
      "\udb82\udc9c",
      "\udb80\udc86",
      "\udb80\udc87",
      "\udb80\udc88",
      "\udb82\udc9d",
      "\udb80\udc89",
      "\udb82\udc9e",
      "\udb80\udc8a",
      "\udb80\udc8b",
      "\udb80\udc85"
    ]
    const discharging = [
      "\udb80\udc8e",
      "\udb80\udc7a",
      "\udb80\udc7b",
      "\udb80\udc7c", 
      "\udb80\udc7d", 
      "\udb80\udc7e", 
      "\udb80\udc7f", 
      "\udb80\udc80", 
      "\udb80\udc81", 
      "\udb80\udc82",
      "\udb80\udc79"
    ];
    const icons = battery.isCharging ? charging : discharging;
    const index = Math.round(battery.percentage / 10);

    return icons[index]
  }

  readonly property bool isCharging: {
    return UPower.displayDevice.state == UPowerDeviceState.Charging;
  }

  readonly property int percentage: {
    return UPower.displayDevice.percentage * 100;
  }
}

