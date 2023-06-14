import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ColumnLayout {
    property alias paymentAmount: paymentAmountLabel.text
    property alias principal: principal.amountNumber
    property alias interest: interest.amountNumber
    property alias cost: cost.amountNumber

    id: root
    spacing: 16
    Label {
        id: monthlyPaymentLabel
        text: qsTr("Your Monthly Payment")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.fillWidth: true
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }

    Label {
        id: paymentAmountLabel
        text: qsTr("$0.00")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.fillWidth: true
        font {
            pixelSize: 32
            family: "Roboto"
        }
    }

    AmountLabels {
        id: principal
        amountLabel: qsTr("Total Principal")
        amountNumber: qsTr("$" + "0.00")
    }

    AmountLabels {
        id: interest
        amountLabel: qsTr("Total Interest")
        amountNumber: qsTr("$" + "0.00")
    }

    AmountLabels {
        id: cost
        amountLabel: qsTr("Total Cost")
        amountNumber: qsTr("$" + "0.00")
    }
}
