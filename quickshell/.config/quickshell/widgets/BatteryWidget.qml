import QtQuick
import "../data"

Text {
  text: {
    return `${Battery.icon} ${Battery.percentage}%`
  }
}
