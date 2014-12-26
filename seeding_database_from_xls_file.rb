require 'roo'

def fetch_excel_data
      ex = Roo::Excel.new("public/your_spreadsheet.xls")
      ex.default_sheet = ex.sheets[0]              #Mention the sheet number (0 is the first sheet, 1 is second sheet, etc.)
      2.upto(500) do | line |                              #Start and end of rows you want to include
      db_column1 = ex.cell(line,'A')                   #Column A in spreadsheet   
      db_column2 = ex.cell(line,'B')
      db_column3 = ex.cell(line,'C')

      x = Class.create(:db_column1 => db_column1, :db_column2 => db_column2, :db_column3 => db_column3)

end