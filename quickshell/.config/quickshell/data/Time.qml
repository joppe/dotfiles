pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: time

  readonly property string time: {
    Qt.formatDateTime(clock.date, "ddd MMM d hh:mm")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}

