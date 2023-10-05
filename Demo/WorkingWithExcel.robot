*** Settings ***
Library           Libraries/RPA/Tables.py    # RPA.Tables
Library           Libraries/ExcelLib/ExcelLibrary.py    # ExcelLib
Library           Libraries/RPA/Excel/Files.py    # RPA.Excel.Files

*** Variables ***
${CellValue}      \



${Table}          \
@{RowsWithYesValue}

${NewTable}       \
@{Table}

*** Test Cases ***
ExcelTC01
    Open Workbook    D:/Study/RIDE-Demo.xlsx
    ${CellValue}=    Get Cell Value    3    3
    Should Be True    isinstance(${CellValue},int)
    Close Workbook

ExcelTC02
    Open Workbook    C:/Users/salduair/Desktop/Robot Projects/Demo/Resources/RIDE-Assignment7-Excel.xlsx
    @{Table}=    Read Worksheet    Sheet1    header=True
    Log Many    @{Table}
    @{RowsWithYesValue}=    Evaluate    [row for row in ${Table} if row['Value']=='Yes']
    Log Many    @{RowsWithYesValue}
    Close Workbook

ExcelTC03
    Open Excel Document    C:/Users/salduair/Desktop/Robot Projects/Demo/Resources/RIDE-Assignment7-Excel.xlsx    SampleDoc
