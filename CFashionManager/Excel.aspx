<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Excel.aspx.cs" Inherits="Excel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="http://faisalman.github.io/simple-excel-js/src/simple-excel.js"></script>
     <style>
            #result td { border : 1px solid #000; padding : 10px }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <label>Load CSV file: </label><input type="file" id="fileInputCSV" /><br/>
        <table id="result"></table>
        <input type="button" id="fileExport" hidden="true" />
        <script type="text/javascript">
            var fileInputCSV = document.getElementById('fileInputCSV'); 
            fileInputCSV.addEventListener('change', function (e) {
                
                // parse as CSV
                var file = e.target.files[0];
                var csvParser = new SimpleExcel.Parser.CSV();
                csvParser.setDelimiter(',');
                csvParser.loadFile(file, function () {
                    
                    // draw HTML table based on sheet data
                    var sheet = csvParser.getSheet();
                    var table = document.getElementById('result');
                    table.innerHTML = "";
                    sheet.forEach(function (el, i) {
                        console.log(el);
                        var row = document.createElement('tr');
                        el.forEach(function (el, i) {
                            var cell = document.createElement('td');
                            cell.innerHTML = el.value;
                            row.appendChild(cell);
                        });
                        table.appendChild(row);
                    });                    
                                    
                    // create button to export as TSV
                    var btnSave = document.getElementById('fileExport');
                    btnSave.hidden = false;
                    btnSave.value = 'Save as TSV file ->';
                    document.body.appendChild(btnSave);
                    
                    // export when button clicked
                    btnSave.addEventListener('click', function (e) {                
                        var tsvWriter = new SimpleExcel.Writer.TSV();
                        tsvWriter.insertSheet(csvParser.getSheet(1));
                        tsvWriter.saveFile();
                    });
                    
                    // print to console just for quick testing
                    //console.log(csvParser.getSheet(1));
                    //console.log(csvParser.getSheet(1).getRow(1));
                    //console.log(csvParser.getSheet(1).getColumn(2));
                    //console.log(csvParser.getSheet(1).getCell(3, 1));
                    //console.log(csvParser.getSheet(1).getCell(2, 3).value); 
                });
            });
            
          
        </script>
</asp:Content>

