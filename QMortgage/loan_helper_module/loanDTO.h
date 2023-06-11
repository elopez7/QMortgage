#ifndef LOANDTO_H
#define LOANDTO_H


#include <QList>
#include <paymentDTO.h>
class QObject;

struct LoanDTO
{
    LoanDTO(    double amount, double rate,
            int term, double payment,
            double totalInterest, double totalCost, QObject *parent = nullptr)
        :m_amount{amount}
        , m_rate{rate}
        , m_term{term}
        , m_payment{payment}
        , m_totalInterest{totalInterest}
        , m_totalCost{totalCost}
    {}

    double m_amount;
    double m_rate;
    int m_term;
    double m_payment;
    double m_totalInterest;
    double m_totalCost;

    QList<PaymentDTO> payments;
};

#endif // LOANDTO_H
