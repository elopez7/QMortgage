.pragma library

function calculate_loan() {
    if(!loanAmountField.amountTextField || rateAmountField.amountTextField || termAmountField.amountTextField){
        return;
    }

    loanHelper.amount = loanAmountField.amountTextField;
    loanHelper.rate = rateAmountField.amountTextField;
    loanHelper.term = termAmountField.amountTextField;
    loanHelper.calculateInterest();
    principal.amountNumber = Number(loanHelper.amount).toLocaleCurrencyString(Qt.locale(), "$");
    interest.amountNumber = Number(loanHelper.totalInterest).toLocaleCurrencyString(Qt.locale(), "$");
    cost.amountNumber = Number(loanHelper.totalCost).toLocaleCurrencyString(Qt.locale(), "$");
    paymentAmountLabel.text = Number(loanHelper.payment).toLocaleCurrencyString(Qt.locale(), "$");
}
