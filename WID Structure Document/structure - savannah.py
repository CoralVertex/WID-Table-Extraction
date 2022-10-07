from bs4 import BeautifulSoup 
from urllib.request import Request,  urlopen
from numpy import NAN
import pandas as pd
from docx import Document
import pdfplumber
import regex as re
from IPython.display import display
import xlsxwriter
import docx

#function that reads table with 2 headers from Word and converts to dataframe
def read_docx_table(document, table_num):
    table = document.tables[table_num]
    data = [[cell.text for cell in row.cells] for row in table.rows]
    df = pd.DataFrame(data)
    outside_col, inside_col = df.iloc[0], df.iloc[1]
    hier_index = pd.MultiIndex.from_tuples(list(zip(outside_col, inside_col)))
    df = pd.DataFrame(data,columns=hier_index).drop(df.index[[0,1]] ).reset_index(drop=True)
    return df

#function to write multiple dataframes in one sheet in Excel
def multiple_dfs(df_list, sheets, file_name, spaces):
    writer = pd.ExcelWriter(file_name,engine='xlsxwriter')   
    row = 0
    for dataframe in df_list:
        dataframe.to_excel(writer,sheet_name=sheets,startrow=row , startcol=0)   
        row = row + len(dataframe.index) + spaces + 1
    writer.save()

document = Document(r"C:\Users\arohrer\Documents\GitHub\MN-LMI-Utilities\WID Structure Document\WIDTables.docx")
#writer = pd.ExcelWriter('structure tables.xlsx', engine='xlsxwriter')
dflist =[]
for i in range(93):
    table_num = i
    df = read_docx_table(document, table_num)
    dflist.append(df)
    #df.to_excel(writer, sheet_name='Sheet'+ str(i+1)) #use this to put each df in its own sheet
#writer.save()
    
multiple_dfs(dflist, 'Sheet1', 'structure.xlsx', 4)


