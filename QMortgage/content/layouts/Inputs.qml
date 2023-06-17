

InputsForm {
    signal calculateInterest()
    calculateButton.onClicked: {
        if(!loanAmount || !loanRate || !loanTerm){
            return
        }

        calculateInterest();
    }
}
