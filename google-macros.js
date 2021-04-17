/** @OnlyCurrentDoc */

//Automatic end of the week setup script
function End() {

    // Automatically generated code from Macro Recording - Start
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
      // Automatically generated code from Macro Recording - End
    
      var dateCells = ['F5','H5','J5','L5','N5','P5','R5']
    
      for (var i = 0; i < dateCells.length; i++) {
        var cell = spreadsheet.getRange(dateCells[i]);
        var formattedDate = new Date(cell.getValue());
        var newDate = new Date(formattedDate.getTime() + 86400000*7);
        cell.setValue(newDate);
      }
     
      var firstDate = Utilities.formatDate(new Date(spreadsheet.getRange('F5').getValue()),'GMT+2',"dd/MM");
      var lastDate = Utilities.formatDate(new Date(spreadsheet.getRange('R5').getValue()),'GMT+2',"dd/MM");
      spreadsheet.getRange('A5').setValue(`${firstDate}-${lastDate}`)
    
      var level = spreadsheet.getRange('G1');
      var cap = spreadsheet.getRange('I1');
      var exp = spreadsheet.getRange('G2');
    
      if(exp.getValue()>cap.getValue()) {
        level.setValue(level.getValue() +1);
        exp.setValue(exp.getValue()-cap.getValue());
        if(level.getValue()%5===0) {
          cap.setValue(cap.getValue()+20);
        }
      }
    };
    
    //Automatic mail sending function
    function myFunction() {
      var spreadsheet = SpreadsheetApp.getActive();
    
      var nicelyFormattedDate = Utilities.formatDate(new Date(),'GMT+2',"dd/MM/YY | hh:mm");
      var subject = `Daily Reminder ${nicelyFormattedDate}`;
      var splitter = '************************\n'
      
      var message = 'Hello Stevan, just a subtle reminder for you to finish the following tasks.\n\n\n';
      message = message + `Remaining Daily Tasks\n${splitter}`;
    
      var today = new Date().getUTCDay();
      var rangesObject = {
        1:['F6:F12','G6:G12','F14:F19','G14:G19'],
        2:['H6:H12','I6:I12','H14:H19','I14:I19'],
        3:['J6:J12','K6:K12','J14:J19','K14:K19'],
        4:['L6:L12','M6:M12','L14:L19','M14:M19'],
        5:['N6:N12','O6:O12','N14:N19','O14:O19'],
        6:['P6:P12','Q6:Q12','P14:P19','Q14:Q19'],
        7:['R6:R12','S6:S12','R14:R19','S14:S19']
      }
    
      var allTasksCompleted = true;
    
      var tasks = spreadsheet.getRange(rangesObject[today][0]).getValues();
      var checks = spreadsheet.getRange(rangesObject[today][1]).getValues();
      for (var i = 0; i < tasks.length; i++) {
        if(checks[i][0]!==true) {
          message = message + tasks[i] + '\n';
          allTasksCompleted = false
        }
      }
    
      tasks = spreadsheet.getRange(rangesObject[today][2]).getValues();
      checks = spreadsheet.getRange(rangesObject[today][3]).getValues();
      for (var i = 0; i < tasks.length; i++) {
        if(checks[i][0]!==true && tasks[i][0]) {
           message = message + tasks[i] + '\n';
           allTasksCompleted = false
        }
      }
    
      allTasksCompleted ? message = message + 'All daily tasks completed!\n' : null;
    
      message = message + `${splitter}Remaining Weekly Tasks\n${splitter}`;
    
      allTasksCompleted = true;
    
      tasks = spreadsheet.getRange('A7:A34').getValues();
      var achieved = spreadsheet.getRange('B7:B34').getValues();
      var required = spreadsheet.getRange('C7:C34').getValues();
      for (var i = 0; i < tasks.length; i++) {
        if(achieved[i] && required[i] && achieved[i][0]!==required[i][0]) {
           message = message + `${tasks[i]} [${achieved[i]}/${required[i]}]\n`;
           allTasksCompleted = false
        }
      }
    
      allTasksCompleted ? message = message + 'All weekly tasks completed!\n' : null;
    
      message = message + `${splitter}\n\nYou an access the Organization sheet here: https://tinyurl.com/organization-todo`
    
      MailApp.sendEmail('stevan.radovanovic@mmklab.org',subject,message);
     
    };