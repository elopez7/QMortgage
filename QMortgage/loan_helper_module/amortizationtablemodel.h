#ifndef AMORTIZATIONTABLEMODEL_H
#define AMORTIZATIONTABLEMODEL_H

#include <QObject>
#include <qqml.h>
#include <QAbstractTableModel>
#include "loanhelper.h"

class AmortizationTableModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_NAMED_ELEMENT(AmortizationTableModelCPP)
    Q_PROPERTY(LoanHelper* loanHelper READ getLoanHelper WRITE setLoanHelper NOTIFY loanHelperChanged FINAL)
public:

    enum class AmortizationTableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole
    };
    Q_ENUM(AmortizationTableRoles);

    explicit AmortizationTableModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex & = QModelIndex()) const override;

    int columnCount(const QModelIndex & = QModelIndex()) const override;

    QVariant headerData(int section, Qt::Orientation orientation, int role) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    LoanHelper* getLoanHelper() const;
    void setLoanHelper(LoanHelper* loanHelper);

signals:
    void loanHelperChanged();

private:
    LoanHelper *m_loanHelper;
    bool m_isConnectedToSignals{false};
};

#endif // AMORTIZATIONTABLEMODEL_H
