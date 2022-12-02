stfips = '05'
countyfips = 1 #no leading zeroes
year = '2018'
area = 'county' #county or state
cohorts = 'fiveyear' #fiveyear or tenyear


import requests
import pandas as pd

url_new = "https://www2.census.gov/programs-surveys/popest/datasets/2020-2021/counties/asrh/cc-est" + year + "-agesex-" + stfips + ".csv"
url_old = "https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/asrh/cc-est2019-agesex-" + stfips + ".csv"
url = ''

baseyear = 0

if year < '2020':
    url = url_old
    baseyear = 2010
else:
    url = url_new
    baseyear = 2020

r = requests.get(url)

FileName = "countypopulationdetail.csv"

with open(FileName,'wb') as f:
	f.write(r.content)

initialDf = pd.read_csv(FileName)

yearnum = int(year)-baseyear+2
newdf = initialDf[(initialDf['COUNTY'] == countyfips) & (initialDf['YEAR'] == yearnum)]
display(newdf)



cols = ['CTYNAME','age', year + ' Total Population', year + ' Male', year + ' Female']
cols2 = [year + ' Total Population', year + ' Male', year + ' Female']
outputDf = pd.DataFrame(columns=cols)

colstring = ['AGE04','AGE59','AGE1014','AGE1519','AGE2024','AGE2529','AGE3034','AGE3539','AGE4044','AGE4549','AGE5054','AGE5559','AGE6064','AGE6569','AGE7074','AGE7579','AGE8084','AGE85PLUS']

for x in colstring:
    tot = x + '_TOT'
    male = x + '_MALE'
    fem = x + '_FEM'
    tempDf = pd.DataFrame([[newdf['CTYNAME'].iloc[0], x, newdf[tot].iloc[0], newdf[male].iloc[0], newdf[fem].iloc[0]]], columns = cols)
    outputDf = pd.concat([outputDf, tempDf])

display(outputDf)

# export file
FileExport = 'CountyPopPyramid'+year+'.xlsx'

with open(FileExport, 'w') as f:
  outputDf.to_excel(FileExport,index=False)





display('Finished!')