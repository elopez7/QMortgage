#include "amortizationtablemodel.h"
#include "enumconverters.h"
#include <QLocale>


AmortizationTableModel::AmortizationTableModel(QObject *parent)
    : m_loanHelper{new LoanHelper(this)}
    ,QAbstractTableModel{parent}
{

}

int AmortizationTableModel::rowCount(const QModelIndex &) const
{
    return m_loanHelper->getPaymentsList().count();
}

int AmortizationTableModel::columnCount(const QModelIndex &) const
{
    return 6;
}

QHash<int, QByteArray> AmortizationTableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[+AmortizationTableRoles::TableDataRole] = "tableData";
    roles[+AmortizationTableRoles::HeadingRole] = "heading";
    return roles;
}

QVariant AmortizationTableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(role != Qt::DisplayRole)
        return QVariant();

    if(orientation == Qt::Horizontal){
        switch (section) {
        case 0:
            return QString("Month");
        case 1:
            return QString("Payment");
        case 2:
            return QString("Principal");
        case 3:
            return QString("Interest");
        case 4:
            return QString("Total Interest");
        case 5:
            return QString("Balance");
        default:
            break;
        }
    }
    return QString();
}

QVariant AmortizationTableModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    if(index.row() >= m_loanHelper->getPaymentsList().size() || index.row() < 0)
        return QVariant();

    QString currencySymbol{"$"};

    if(role == +AmortizationTableRoles::TableDataRole){
        const auto &loan = m_loanHelper->getPaymentsList().at(index.row());

        switch (index.column()) {
        case 0:
            return loan->m_month;
        case 1:
            return QString(QLocale().toCurrencyString(loan->m_payment, currencySymbol));
        case 2:
            return QString(QLocale().toCurrencyString(loan->m_monthlyPrincipal, currencySymbol));
        case 3:
            return QString(QLocale().toCurrencyString(loan->m_monthlyInterest, currencySymbol));
        case 4:
            return QString(QLocale().toCurrencyString(loan->m_totalInterest, currencySymbol));
        case 5:
            return QString(QLocale().toCurrencyString(loan->m_balance, currencySymbol));
        default:
            break;
        }
    }
    return QVariant();
}

LoanHelper *AmortizationTableModel::getLoanHelper() const
{
    return m_loanHelper;
}

void AmortizationTableModel::setLoanHelper(LoanHelper *loanHelper)
{
    beginResetModel();
    if(m_loanHelper && m_isConnectedToSignals){
        m_loanHelper->disconnect(this);
    }

    m_loanHelper = loanHelper;
    emit loanHelperChanged();

    connect(m_loanHelper, &LoanHelper::preResetModel, this, [=](){
        beginResetModel();
    });
    connect(m_loanHelper, &LoanHelper::postResetModel, this, [=](){
        endResetModel();
    });

    connect(m_loanHelper, &LoanHelper::preAddPaymentToModel, this, [=](){
        const int index = m_loanHelper->getPaymentsList().count();
        beginInsertRows(QModelIndex(), index, index);
    });

    connect(m_loanHelper, &LoanHelper::postAddPaymentToModel, this, [=](){
        endInsertRows();
    });

    endResetModel();
}
