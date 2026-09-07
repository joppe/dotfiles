import QtQuick
import QtQuick.Layouts
import "../settings"

Rectangle {
  id: pill

  // --- Sizing ---
  implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
  implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

  // So it behaves predictably when placed directly in a Layout,
  // without the caller having to set these explicitly.
  Layout.preferredWidth: implicitWidth
  Layout.preferredHeight: implicitHeight

  // --- Padding ---
  property real leftPadding: Sizes.md
  property real rightPadding: Sizes.md
  property real topPadding: Sizes.sm
  property real bottomPadding: Sizes.sm

  // --- Shape ---
  radius: Sizes.lg
  color: Colors.base
  clip: true

  // Smooth transitions if color changes (e.g. hover/urgent states)
  Behavior on color {
      ColorAnimation { duration: 150 }
  }

  // --- Content ---
  // Lets callers do: Pill { Text { ... } } or Pill { RowLayout { ... } }
  default property alias content: contentItem.children

  Item {
    id: contentItem

    anchors {
      fill: parent
      leftMargin: pill.leftPadding
      rightMargin: pill.rightPadding
      topMargin: pill.topPadding
      bottomMargin: pill.bottomPadding
    }

    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
  }
}
