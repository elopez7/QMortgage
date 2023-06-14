import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import loanHelperModule
import "../tables"

ColumnLayout{
    property alias amortizationTable: amortizationTable
    property alias loanHelper: amortizationModel.loanHelper
    property alias tableColumnWidthProvider: amortizationTable.columnWidthProvider

    id: tableLayout
    spacing: 1

    HorizontalHeaderView{
        id: horizontalHeader
        Layout.fillWidth: true
        syncView: amortizationTable
        boundsBehavior: Flickable.StopAtBounds
        clip: true
        resizableColumns: false
    }

    AmortizationTableModelCPP{
        id: amortizationModel
        loanHelper: loanHelper
    }

    AmortizationTable{
        id: amortizationTable
        Layout.fillWidth: true
        Layout.fillHeight: true
        boundsBehavior: Flickable.StopAtBounds
        model: amortizationModel
    }
}
