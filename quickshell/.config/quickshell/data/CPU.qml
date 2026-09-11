pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: cpu

  property int usage: 0
  property real lastIdle: 0
  property real lastTotal: 0
  property var history: []

  Process {
    id: cpuProcess

    command: ['head', '-n', '1', '/proc/stat']
    running: true

    stdout: SplitParser {
      onRead: data => {
        // data format: "cpu  user nice system idle iowait irq softirq steal guest guest_nice"
        const parts = data.trim().split(/\s+/).slice(1).map(Number);
        const idle = parts[3] + parts[4]; // idle + iowait
        const total = parts.reduce((a, b) => a + b, 0);

        const diffIdle = idle - cpu.lastIdle;
        const diffTotal = total - cpu.lastTotal;

        if (diffTotal > 0) {
          const usage = Math.floor((1 - diffIdle / diffTotal) * 100);
          const history = cpu.history;

          history.unshift(usage);

          while (history.length < 10) {
            history.unshift(usage);
          }

          cpu.history = history.slice(0, 10);
          cpu.usage = usage;
        }

        cpu.lastIdle = idle;
        cpu.lastTotal = total;
      }
    }
  }

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: cpuProcess.running = true
  }
}
