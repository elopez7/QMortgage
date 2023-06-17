import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QMortgage

ColumnLayout {
    id: root
    property alias amountLabelText: amountLabel.text
    property alias amountTextField: amountTextField.text
    property alias placeholderText: amountTextField.placeholderText
    Label {
        id: amountLabel
        text: qsTr("Loan Amount")
        verticalAlignment: Text.AlignBottom
        Layout.fillWidth: true
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }

    TextField {
        id: amountTextField
        horizontalAlignment: Text.AlignRight
        Layout.maximumHeight: 32
        Layout.preferredHeight: 32
        Layout.fillHeight: true
        Layout.fillWidth: true
        placeholderText: qsTr("0.00")
        validator: DoubleValidator {
            bottom: 0
            decimals: 2
            notation: DoubleValidator.StandardNotation
        }
        font {
            pixelSize: 16
            family: "Roboto"
        }
    }
}
