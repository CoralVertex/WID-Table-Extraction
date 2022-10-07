import pdfplumber
import pandas as pd
import regex as re


# get old descriptions from pdf
table = pd.DataFrame(columns = ['TableName','TableDesc','FieldDetails'])

x = 10
with pdfplumber.open('WID3_DD_20220617.pdf') as pdf:
    while x < 71:#len(pd.Series(pdf.pages).index)-1:
        text = pdf.pages[x].extract_text()
        numTables = text.count('Field Name Type Constraint Description')
        y = 0
        while y < numTables:
            if re.search('Administrative Tables',text.split('Field Name Type Constraint Description')[y]):
                tableNameDesc = text.split('Field Name Type Constraint Description')[y+1]
                fieldDetails = text.split('Field Name Type Constraint Description')[y+2]
            elif re.search('Data Tables',text.split('Field Name Type Constraint Description')[y]):
                tableNameDesc = text.split('Field Name Type Constraint Description')[y+1]
                #fieldDetails = text.split('Field Name Type Constraint Description')[y+2]
            elif re.search('Crosswalk Tables',text.split('Field Name Type Constraint Description')[y]):
                tableNameDesc = text.split('Field Name Type Constraint Description')[y+1]
                #fieldDetails = text.split('Field Name Type Constraint Description')[y+2]
            elif re.search('Look-up Tables',text.split('Field Name Type Constraint Description')[y]):
                tableNameDesc = text.split('Field Name Type Constraint Description')[y+1]
                fieldDetails = text.split('Field Name Type Constraint Description')[y+2]
            else: 
                tableNameDesc = text.split('Field Name Type Constraint Description')[y]
                fieldDetails = text.split('Field Name Type Constraint Description')[y+1]
            
                tableNameDesc = tableNameDesc.replace(' Revised in v3.0','')

                if tableNameDesc[:1] == '\n':
                    numSplits = len(pd.Series(tableNameDesc.split('\n')).index)
                    table = table.append({'TableName':tableNameDesc.split('\n')[numSplits-3], 'TableDesc':tableNameDesc.split('\n')[numSplits-2], 'FieldDetails':fieldDetails.split('\n')}, ignore_index=True)
                else: 
                    table = table.append({'TableName':tableNameDesc.split('\n')[0], 'TableDesc':tableNameDesc.split('\n')[1], 'FieldDetails':fieldDetails.split('\n')}, ignore_index=True)
            y = y + 1
        x = x + 1


for tname in table['TableName']:
    listM = table.index[table['TableName'] == tname].tolist()
    m = listM[0]
    rows = len(pd.Series(table[table['TableName'] == tname]['FieldDetails'][m]).index)
    # get rid of constraints box
    if 'Constraint Information' in table[table['TableName'] == tname]['FieldDetails'][m]:
        indexVal = table[table['TableName'] == tname]['FieldDetails'][m].index('Constraint Information')
        z = rows-1
        while z >= indexVal:
            table[table['TableName'] == tname]['FieldDetails'][m].pop(z)
            z = z - 1
    # clean up values
    rows = len(pd.Series(table[table['TableName'] == tname]['FieldDetails'][m]).index)
    a = 0
    while a < rows:
        # get rid of foreign key indicators
        table[table['TableName'] == tname]['FieldDetails'][m][a]=table[table['TableName'] == tname]['FieldDetails'][m][a].replace('1, ','')
        table[table['TableName'] == tname]['FieldDetails'][m][a]=table[table['TableName'] == tname]['FieldDetails'][m][a].replace('2, ','')
        if re.search('1 ',table[table['TableName'] == tname]['FieldDetails'][m][a][:2]):
            table[table['TableName'] == tname]['FieldDetails'][m][a]=table[table['TableName'] == tname]['FieldDetails'][m][a].replace('1 ','')
        if re.search('2 ',table[table['TableName'] == tname]['FieldDetails'][m][a][:2]):
            table[table['TableName'] == tname]['FieldDetails'][m][a]=table[table['TableName'] == tname]['FieldDetails'][m][a].replace('2 ','')
        # get rid of footer
        if table[table['TableName'] == tname]['FieldDetails'][m][a][:22]=='WID Database Structure':
            table[table['TableName'] == tname]['FieldDetails'][m][a]=''
        # get rid of word wrapping
        if re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a][:1]):
            if a < rows - 3 and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+1][:1]) and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+2][:1]) and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+3][:1]):
                table[table['TableName'] == tname]['FieldDetails'][m][a-1]=table[table['TableName'] == tname]['FieldDetails'][m][a-1]+table[table['TableName'] == tname]['FieldDetails'][m][a]+table[table['TableName'] == tname]['FieldDetails'][m][a+1]+table[table['TableName'] == tname]['FieldDetails'][m][a+2]+table[table['TableName'] == tname]['FieldDetails'][m][a+3]
                table[table['TableName'] == tname]['FieldDetails'][m][a+1]=''
                table[table['TableName'] == tname]['FieldDetails'][m][a+2]=''
                table[table['TableName'] == tname]['FieldDetails'][m][a+3]=''
            if a < rows - 2 and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+1][:1]) and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+2][:1]):
                table[table['TableName'] == tname]['FieldDetails'][m][a-1]=table[table['TableName'] == tname]['FieldDetails'][m][a-1]+table[table['TableName'] == tname]['FieldDetails'][m][a]+table[table['TableName'] == tname]['FieldDetails'][m][a+1]+table[table['TableName'] == tname]['FieldDetails'][m][a+2]
                table[table['TableName'] == tname]['FieldDetails'][m][a+1]=''
                table[table['TableName'] == tname]['FieldDetails'][m][a+2]=''
            if a < rows - 1 and re.search('[a-zA-Z]', table[table['TableName'] == tname]['FieldDetails'][m][a+1][:1]):
                table[table['TableName'] == tname]['FieldDetails'][m][a-1]=table[table['TableName'] == tname]['FieldDetails'][m][a-1]+table[table['TableName'] == tname]['FieldDetails'][m][a]+table[table['TableName'] == tname]['FieldDetails'][m][a+1]
                table[table['TableName'] == tname]['FieldDetails'][m][a+1]=''
            table[table['TableName'] == tname]['FieldDetails'][m][a-1]=table[table['TableName'] == tname]['FieldDetails'][m][a-1]+table[table['TableName'] == tname]['FieldDetails'][m][a]
            table[table['TableName'] == tname]['FieldDetails'][m][a]=''
        a = a + 1
    
    rows = len(pd.Series(table[table['TableName'] == tname]['FieldDetails'][m]).index)
    b = 0
    while b < rows:
    # delete unneeded rows (empty strings, foreign key indicators)
        if table[table['TableName'] == tname]['FieldDetails'][m][b]=='' or table[table['TableName'] == tname]['FieldDetails'][m][b]=='1' or table[table['TableName'] == tname]['FieldDetails'][m][b]=='2' or table[table['TableName'] == tname]['FieldDetails'][m][b]=='3' or table[table['TableName'] == tname]['FieldDetails'][m][b]=='4':
            table[table['TableName'] == tname]['FieldDetails'][m].pop(b)
            rows = len(pd.Series(table[table['TableName'] == tname]['FieldDetails'][m]).index)
        b = b + 1




print("Finished!")