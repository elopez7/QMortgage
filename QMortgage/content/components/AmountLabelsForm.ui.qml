import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QMortgage

RowLayout {
    id: principal

    property alias amountLabel: amountLabel.text
    property alias amountNumber: amountNumber.text

    Label {
        id: amountLabel
        text: "Amount Label"
        Layout.fillWidth: true
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }
    Label {
        id: amountNumber
        text: "Amount in Dollars"
        horizontalAlignment: Text.AlignRight
        Layout.fillWidth: true
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }
}
