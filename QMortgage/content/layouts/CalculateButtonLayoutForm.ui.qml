import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    property alias calculateButton: calculateButton
    id: root
    spacing: 16
    Button {
        id: calculateButton
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        text: qsTr("Calculate")
        Layout.fillWidth: true
        font {
            pixelSize: fontSize
            family: "Roboto"
        }
    }
}
