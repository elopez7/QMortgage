

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
import Qt.labs.qmlmodels
import loanHelperModule
import "components"
import "js/common.js" as Common

GridLayout {

    property int fontSize: 28

    id: appLayout
    columns: 2
    flow: GridLayout.LeftToRight
    rowSpacing: 16
    states: [
        State {
            when: appLayout.width <= 480
            PropertyChanges {
                target: leftBox
                Layout.columnSpan: 2
            }
            PropertyChanges {
                target: rightBox
                Layout.columnSpan: 2
            }
        },

        State {
            when: appLayout.width > 480
            PropertyChanges {
                target: leftBox
                Layout.columnSpan: 1
            }

            PropertyChanges {
                target: calculateInLayoutButton
                visible: true
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            }

            PropertyChanges {
                target: rightBox
                Layout.columnSpan: 1
            }

            PropertyChanges {
                target: buttonLayout
                Layout.columnSpan: 1
                visible: false
            }
        }
    ]

    LoanHelper{
        id: loanHelper
    }

    Binding{loanHelper.amount: loanAmountField.amountTextField}
    Binding{loanHelper.rate: rateAmountField.amountTextField}
    Binding{loanHelper.term: termAmountField.amountTextField}
    Binding{principal.amountNumber: Number(loanHelper.amount).toLocaleCurrencyString(Qt.locale(), "$")}
    Binding{interest.amountNumber: Number(loanHelper.totalInterest).toLocaleCurrencyString(Qt.locale(), "$")}
    Binding{cost.amountNumber: Number(loanHelper.totalCost).toLocaleCurrencyString(Qt.locale(), "$")}
    Binding{paymentAmountLabel.text: Number(loanHelper.payment).toLocaleCurrencyString(Qt.locale(), "$")}

    ColumnLayout {
        id: leftBox
        Layout.columnSpan: 2
        spacing: 16
        Layout.maximumWidth: 480
        Layout.fillHeight: true
        Layout.fillWidth: true
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

        Button {
            id: calculateInLayoutButton
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Calculate")
            Layout.fillWidth: true
            Layout.maximumWidth: leftBox.width / 3
            visible: false
            font {
                pixelSize: fontSize
                family: "Roboto"
            }
        }
    }

    ColumnLayout {
        id: rightBox
        Layout.maximumWidth: appLayout.width
        Layout.columnSpan: 2
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

    ColumnLayout {
        id: buttonLayout
        Layout.columnSpan: 2
        spacing: 16
        Layout.maximumWidth: 480
        Layout.fillHeight: true
        Layout.fillWidth: true
        visible: true
        Button {
            id: calculateOutLayoutButton
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Calculate")
            Layout.fillWidth: true
            font {
                pixelSize: fontSize
                family: "Roboto"
            }
        }
    }

    ColumnLayout{
        id: tableLayout
        Layout.columnSpan: 2
        spacing: 1
        Layout.alignment: Qt.AlignHCenter
        visible: false

        HorizontalHeaderView{
            id: horizontalHeader
            Layout.fillWidth: true
            syncView: amortizationTable
            boundsBehavior: Flickable.StopAtBounds
            clip: true
        }

        AmortizationTableModelCPP{
            id: amortizationModel
            loanHelper: loanHelper
        }

        AmortizationTable{
            id: amortizationTable
            Layout.fillWidth: true
            Layout.fillHeight: true
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            model: amortizationModel
        }

    }

    Connections{
        target: calculateInLayoutButton
        function onClicked(){
            if(!loanAmountField.amountTextField || !rateAmountField.amountTextField || !termAmountField.amountTextField){
                return;
            }
            loanHelper.calculateInterest();
            tableLayout.visible = true
        }
    }

    Connections{
        target: calculateOutLayoutButton
        function onClicked(){
            if(!loanAmountField.amountTextField || !rateAmountField.amountTextField || !termAmountField.amountTextField){
                return;
            }
            loanHelper.calculateInterest();
            tableLayout.visible = true
        }
    }
}
