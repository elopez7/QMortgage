

AmortTableForm {
    function updateLayout(window_width){
        tableColumnWidthProvider = function(column){return window_width / amortizationTable.columns};
        amortizationTable.forceLayout();
    }
}
