import QtQuick

CalculateButtonLayoutForm{
    signal calculateInterest()

    calculateButton.onClicked: {
        calculateInterest()
    }
}
