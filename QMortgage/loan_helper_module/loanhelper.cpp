#include "loanhelper.h"
#include <QtMath>
#include <QLocale>

LoanHelper::LoanHelper(QObject *parent)
    : QObject{parent}
{

}

void LoanHelper::calculateInterest()
{
    if(!m_payments.empty()){
        emit preResetModel();
        m_payments.clear();
        emit postResetModel();
    }

    m_payment = calculatePayment();

    double balance{m_amount};
    double totalInterest{0};
    double monthlyInterest{0};
    double monthlyPrincipal{0};
    double monthlyRate{calculateMonthlyRate()};

    for(int month = 0; month <= m_term; month++){
        monthlyInterest = balance * monthlyRate;
        totalInterest += monthlyInterest;
        monthlyPrincipal = m_payment - monthlyInterest;
        balance -= monthlyPrincipal;

        PaymentDTO* loanPayment{new PaymentDTO(month,
                                               m_payment,
                                               monthlyPrincipal,
                                               monthlyInterest,
                                               totalInterest,
                                               balance,
                                               this)};

        appendPaymentToList(loanPayment);
    }

    m_totalInterest = totalInterest;
    m_totalCost = (getAmount() + getTotalInterest());
}

double LoanHelper::calculatePayment()
{
    double monthlyRate{calculateMonthlyRate()};
    double payment{(m_amount * monthlyRate) / (1 - qPow((1 + monthlyRate), -m_term))};

    return payment;
}

double LoanHelper::calculateMonthlyRate()
{
    return m_rate / 1200;
}

double LoanHelper::getAmount() const
{
    return m_amount;
}

void LoanHelper::setAmount(const double newAmount)
{
    m_amount = newAmount;
}

double LoanHelper::getRate() const
{
    return m_rate;
}

void LoanHelper::setRate(const double newRate)
{
    m_rate = newRate;
}

int LoanHelper::getTerm() const
{
    return m_term;
}

void LoanHelper::setTerm(const int newTerm)
{
    m_term= newTerm;
}

double LoanHelper::getPayment() const
{
    return m_payment;
}

void LoanHelper::setPayment(const double newPayment)
{
    m_payment = newPayment;
}

double LoanHelper::getTotalInterest() const
{
    return m_totalInterest;
}

void LoanHelper::setTotalInterest(const double newTotalInterest)
{
    m_totalInterest = newTotalInterest;
}

double LoanHelper::getTotalCost() const
{
    return m_totalCost;
}

void LoanHelper::setTotalCost(const double newTotalCost)
{
    m_totalCost = newTotalCost;
}

QList<PaymentDTO *> LoanHelper::getPaymentsList()
{
    return m_payments;
}

void LoanHelper::appendPaymentToList(PaymentDTO *paymentToAdd)
{
    emit preAddPaymentToModel();
    m_payments.append(paymentToAdd);
    emit postAddPaymentToModel();
}
