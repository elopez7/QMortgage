#ifndef PAYMENTDTO_H
#define PAYMENTDTO_H

class QObject;

struct PaymentDTO
{
    PaymentDTO(int month, double payment,
               double monthlyPrincipal, double monthlyInterest,
               double totalInterest, double balance, QObject *parent = nullptr)
        : m_month{month}
        , m_payment{payment}
        , m_monthlyPrincipal{monthlyPrincipal}
        , m_monthlyInterest{monthlyInterest}
        , m_totalInterest{totalInterest}
        , m_balance{balance}
    {}

    int m_month;
    double m_payment;
    double m_monthlyPrincipal;
    double m_monthlyInterest;
    double m_totalInterest;
    double m_balance;
};

#endif // PAYMENTDTO_H
