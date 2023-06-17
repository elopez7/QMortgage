import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ColumnLayout {
    property alias loanAmount: loanAmountField.amountTextField
    property alias loanRate: rateAmountField.amountTextField
    property alias loanTerm: termAmountField.amountTextField
    property alias calculateButton: calculateButton

    id: root
    spacing: 16
    Label {
        id: appTitleLabel
        text: qsTr("Loan Calculator")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Layout.fillWidth: true
        font {
            pixelSize: 32
            family: "Roboto"
        }
    }

    NumberInput {
        id: loanAmountField
        amountLabelText: qsTr("Loan Amount")
    }

    NumberInput {
        id: termAmountField
        amountLabelText: qsTr("Loan Term")
        placeholderText: qsTr("Months")
    }

    NumberInput {
        id: rateAmountField
        amountLabelText: qsTr("Loan Rate")
    }

    Button {
        id: calculateButton
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        text: qsTr("Calculate")
        Layout.fillWidth: true
        Layout.maximumWidth: root.width / 3
        visible: false
        font {
            pixelSize: fontSize
            family: "Roboto"
        }
    }
}
