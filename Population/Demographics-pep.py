stfips = '05'
year = '2016'
cohorts = [[0,18],[19,25],[26,35],[36,45],[46,55],[56,65],[66,75],[76,85]]


import requests
import pandas as pd

def pivot_years(dfname):
    currentyear = 'base'
    #relabel merged cells
    x = 0
    while x < len(dfname.columns):
        if pd.isna(dfname.iloc[2, x]):
            dfname.iloc[2, x] = currentyear
        else:
            currentyear = dfname.iloc[2, x]
            dfname.iloc[2, x] = currentyear
        x = x + 1

    dfname.columns = range(dfname.columns.size)
    z = 0
    #remove stray '.'
    while z < len(dfname.index):
        dfname[0].iloc[z] = str(dfname[0].iloc[z]).replace('.','').replace('+','')
        z = z + 1
    y = 0
    #create coherent column headers
    while y < len(dfname.columns):
        if y == 0:
            dfname.rename(columns = {y: 'age'}, inplace = True)
        else:
            dfname.rename(columns = {y: str(dfname.iloc[2, y]) + ' ' + str(dfname.iloc[3, y]).replace('\n',' ')}, inplace = True)
        y = y + 1
    dfname.rename(columns = {'base nan': 'age'})
    #export only age rows
    return dfname.iloc[4:91]

url_new = "https://www2.census.gov/programs-surveys/popest/tables/2020-2021/state/asrh/sc-est2021-syasex-" + stfips + ".xlsx"
url_old = "https://www2.census.gov/programs-surveys/popest/tables/2010-2019/state/asrh/sc-est2019-syasex-" + stfips + ".xlsx"
url = ''

if year < '2020':
    url = url_old
else:
    url = url_new

r = requests.get(url)

FileName = "populationdetail.xlsx"

with open(FileName,'wb') as f:
	f.write(r.content)

initialDf = pd.read_excel(FileName)

outputDf = pivot_years(initialDf)
cols = ['age', year + ' Total Population', year + ' Male', year + ' Female']
cols2 = [year + ' Total Population', year + ' Male', year + ' Female']


workingDf = outputDf[cols]
workingDf['cohort'] = 'Total'

y = 1
while y < len(workingDf.index):
    x = 0
    while x < len(cohorts):
        #display(x)
        #display(cohorts[x][1])
        if int(workingDf['age'].iloc[y]) <= cohorts[x][1]:
            workingDf['cohort'].iloc[y] = str(cohorts[x][0]) + ' - ' + str(cohorts[x][1])
            break
        else:
            x = x + 1
    y = y + 1


exportDf = workingDf.groupby(['cohort'])[cols2].apply(lambda x : x.astype(int).sum())
# export file
FileExport = 'PopPyramid'+year+'.xlsx'

with open(FileExport, 'w') as f:
  exportDf[cols2].to_excel(FileExport,index=False)



display(exportDf[cols2])
