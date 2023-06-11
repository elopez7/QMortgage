#ifndef LOANHELPER_H
#define LOANHELPER_H

#include <QObject>
#include <QProperty>
#include <QtQml/qqmlregistration.h>
#include "paymentDTO.h"

class LoanHelper : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(LoanHelper)

    Q_PROPERTY(double amount READ getAmount WRITE setAmount BINDABLE bindableAmount FINAL)
    Q_PROPERTY(double rate READ getRate WRITE setRate BINDABLE bindableRate FINAL)
    Q_PROPERTY(int term READ getTerm WRITE setTerm BINDABLE bindableTerm FINAL)
    Q_PROPERTY(double payment READ getPayment WRITE setPayment BINDABLE bindablePayment FINAL)
    Q_PROPERTY(double totalInterest READ getTotalInterest WRITE setTotalInterest BINDABLE bindableTotalInterest FINAL)
    Q_PROPERTY(double totalCost READ getTotalCost WRITE setTotalCost BINDABLE bindableTotalCost FINAL)

public:
    explicit LoanHelper(QObject *parent = nullptr);

    QBindable<double> bindableAmount() {return &m_amount;}
    QBindable<double> bindableRate() {return &m_rate;}
    QBindable<int> bindableTerm() {return &m_term;}
    QBindable<double> bindablePayment() {return &m_payment;}
    QBindable<double> bindableTotalInterest() {return &m_totalInterest;}
    QBindable<double> bindableTotalCost() {return &m_totalCost;}

    Q_INVOKABLE void calculateInterest();

    double getAmount() const;
    void setAmount(const double newAmount);

    double getRate() const;
    void setRate(const double newRate);

    int getTerm() const;
    void setTerm(const int newTerm);

    double getPayment() const;
    void setPayment(const double newPayment);

    double getTotalInterest() const;
    void setTotalInterest(const double newTotalInterest);

    double getTotalCost() const;
    void setTotalCost(const double newTotalCost);

    QList<PaymentDTO*> getPaymentsList();

signals:
    void amountChanged();
    void rateChanged();
    void termChanged();
    void paymentChanged();
    void totalInterestChanged();
    void totalCostChanged();

    void preAddPaymentToModel();
    void postAddPaymentToModel();
    void preResetModel();
    void postResetModel();

private:
    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               double,
                               m_amount,
                               &LoanHelper::amountChanged);

    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               double,
                               m_rate,
                               &LoanHelper::rateChanged);

    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               int,
                               m_term,
                               &LoanHelper::termChanged);

    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               double,
                               m_payment,
                               &LoanHelper::paymentChanged);

    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               double,
                               m_totalInterest,
                               &LoanHelper::totalInterestChanged);

    Q_OBJECT_BINDABLE_PROPERTY(LoanHelper,
                               double,
                               m_totalCost,
                               &LoanHelper::totalCostChanged);

    QList<PaymentDTO*> m_payments;
    void appendPaymentToList(PaymentDTO* paymentToAdd);
    double calculateMonthlyRate();
    double calculatePayment();
};

#endif // LOANHELPER_H
