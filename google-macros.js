// End of the Week Function
function End() {
    var spreadsheet = SpreadsheetApp.getActive();
    spreadsheet.getRange('N28:O34').activate();
    spreadsheet.getCurrentCell().setFormula('=(G2+P32)');
    spreadsheet.getRange('G2').setValue(spreadsheet.getRange('N28').getValue());
    spreadsheet.getRange('N28').clearContent();
  
    spreadsheet.getRange('G6:G12').activate();
    spreadsheet.getRange('I34').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_VALUES, false);
    spreadsheet.getRange('G14:G19').activate();
    spreadsheet.getRange('I34').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_VALUES, false);
    spreadsheet.getRange('F14:F19').activate();
    spreadsheet.getActiveRangeList().clear({contentsOnly: true, skipFilteredRows: true});
    spreadsheet.getRange('F6:G20').activate();
    spreadsheet.getActiveRange().autoFill(spreadsheet.getRange('F6:S20'), SpreadsheetApp.AutoFillSeries.DEFAULT_SERIES);
    spreadsheet.getRange('B7').activate();
  
    spreadsheet.getRange('B7:B24').activate();
    spreadsheet.getRange('G34').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_VALUES, false);
};