pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  id: time
  property string time

  Process {
    id: dateProc
    // the command to run, every argument is its own string
    command: ["date"]
    // run the command immediately
    running: true
    // process the output of the command
    stdout: StdioCollector {
      // listen to when the stream is finished
      onStreamFinished: time.time = this.text
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true
  }
}

