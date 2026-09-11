pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: ram

  property int usageMb: 0
  property int totalMb: 0
  property int usage: 0
  property var history: []

  Process {
    id: ramProcess

    command: ['grep', '-E', '^(MemTotal|MemAvailable):', '/proc/meminfo']
    running: true

    stdout: SplitParser {
      onRead: data => {
        // data format: "MemTotal: 16384 kB" or "MemAvailable: 8192 kB"
        const match = data.match(/^(\w+):\s+(\d+)/);
        if (!match) return;

        const key = match[1];
        const kb = parseInt(match[2]);

        if (key === "MemTotal") ram.totalMb = Math.floor(kb / 1024);
        if (key === "MemAvailable") {
          const usedMb = ram.totalMb - Math.floor(kb / 1024);

          ram.usageMb = usedMb;

          if (ram.totalMb > 0) {
            const pct = Math.floor((usedMb / ram.totalMb) * 100);
            const history = ram.history;

            history.unshift(pct);

            while (history.length < 10) {
              history.unshift(pct);
            }

            ram.history = history.slice(0, 10);
            ram.usage = pct;
          }
        }
      }
    }
  }

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: ramProcess.running = true
  }
}
