import QtQuick


OutputsForm {

    function setOutput(in_payment, in_principal, in_interest, in_cost){
        paymentAmount= Number(in_payment).toLocaleCurrencyString(Qt.locale(), "$")
        principal= Number(in_principal).toLocaleCurrencyString(Qt.locale(), "$")
        interest= Number(in_interest).toLocaleCurrencyString(Qt.locale(), "$")
        cost= Number(in_cost).toLocaleCurrencyString(Qt.locale(), "$")
    }

}
