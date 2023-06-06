

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QMortgage
import "components"

Item {
    id: root
    width: Constants.width
    height: Constants.height

    ColumnLayout {
        id: appLayout
        anchors.fill: parent
        anchors.margins: 16
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
        }

        NumberInput {
            id: rateAmountField
            amountLabelText: qsTr("Loan Rate")
        }

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

        Button {
            id: calculateButton
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Calculate")
            font {
                pixelSize: 32
                family: "Roboto"
                color: "black"
            }
        }
    }
}
