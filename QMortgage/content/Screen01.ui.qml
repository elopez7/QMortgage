

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
import "layouts"
import "tables"
import "js/common.js" as Common

GridLayout {

    property int fontSize: 28
    property string currencySymbol: "$"

    id: appLayout
    columns: 2
    flow: GridLayout.LeftToRight
    rowSpacing: 16
    columnSpacing: 32

    LoanHelper {
        id: loanHelper
    }

    Inputs {
        id: leftBox
        Layout.columnSpan: 2
        Layout.maximumWidth: 480
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Outputs {
        id: rightBox
        Layout.maximumWidth: appLayout.width
        Layout.columnSpan: 2
        spacing: 16
    }

    CalculateButtonLayout {
        id: buttonLayout
        Layout.columnSpan: 2
        Layout.maximumWidth: 480
        Layout.fillHeight: true
        Layout.fillWidth: true
        visible: true
    }

    AmortTable {
        id: tableLayout
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        visible: false
        loanHelper: loanHelper
    }

    Connections {
        target: leftBox
        function onCalculateInterest(loanAmount, loanRate, loanTerm) {
            loanHelper.calculateInterest()
            tableLayout.visible = true
        }
    }

    Connections {
        target: buttonLayout
        function onCalculateInterest() {
            loanHelper.calculateInterest()
            tableLayout.visible = true
        }
    }

    Connections {
        target: appLayout
        function onWidthChanged() {
            tableLayout.updateLayout(appLayout.width - 4)
        }
    }

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
                target: leftBox.calculateButton
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

    Binding {
        loanHelper.amount: leftBox.loanAmount
    }
    Binding {
        loanHelper.rate: leftBox.loanRate
    }
    Binding {
        loanHelper.term: leftBox.loanTerm
    }
    Binding {
        rightBox.paymentAmount: Number(
                                    loanHelper.payment).toLocaleCurrencyString(
                                    Qt.locale(), currencySymbol)
    }
    Binding {
        rightBox.principal: Number(loanHelper.amount).toLocaleCurrencyString(
                                Qt.locale(), currencySymbol)
    }
    Binding {
        rightBox.cost: Number(loanHelper.totalCost).toLocaleCurrencyString(
                           Qt.locale(), currencySymbol)
    }
    Binding {
        rightBox.interest: Number(
                               loanHelper.totalInterest).toLocaleCurrencyString(
                               Qt.locale(), currencySymbol)
    }
}
