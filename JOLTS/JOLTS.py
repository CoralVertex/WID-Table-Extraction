# imported the requests library
import requests
import pandas as pd

typeVar = 'current' #current (Nine years of data plus year-to-date estimates) or all
states = ['00','27']
years = [2022,2021]

series_url = "https://download.bls.gov/pub/time.series/jt/jt.series"
industry_url = "https://download.bls.gov/pub/time.series/jt/jt.industry"
current_url = "https://download.bls.gov/pub/time.series/jt/jt.data.0.Current"
all_url = "https://download.bls.gov/pub/time.series/jt/jt.data.1.AllItems"


# which URL to use
if typeVar == "current":
	data_url = current_url
else:
	data_url = all_url


# URL of the file to be downloaded is defined
data = requests.get(data_url) # create HTTP response object
industry = requests.get(industry_url)
series = requests.get(series_url)

# send a HTTP request to the server and save
# the HTTP response in a response object called r
with open('data.txt','wb') as f:
	f.write(data.content)

with open('industry.txt','wb') as f:
	f.write(industry.content)

with open('series.txt','wb') as f:
	f.write(series.content)

dataTable = pd.read_csv('data.txt',sep='\t')
industryLookup = pd.read_csv('industry.txt',sep='\t')
seriesLookup = pd.read_csv('series.txt',sep='\t')

dataTable = dataTable.rename(columns={'series_id                     ':'series_id','       value':'value'})
seriesLookup = seriesLookup.rename(columns={'series_id                     ':'series_id'})
dataTable = dataTable.set_index('series_id').join(seriesLookup.set_index('series_id'), rsuffix='_series')

dataTable['stfips'] = dataTable['state_code']
dataTable['areatype'] = '01'
dataTable['area'] = '000000'
dataTable['periodyear'] = dataTable['year']
dataTable['periodtype'] = '03'
dataTable['period'] = dataTable['period'].str[1:]
dataTable['adjusted'] = '0'
dataTable['prelim'] = '0'
dataTable['joltstypecode'] = dataTable['dataelement_code']
dataTable['sizeclasscode'] = dataTable['sizeclass_code']
dataTable['indcodetype'] = '20'
dataTable = dataTable.reset_index()

for x in range(max(dataTable.index)+1):
    if dataTable['state_code'].iloc[x] == '00':
        dataTable['areatype'].iloc[x] = '00'

    if dataTable['period'].iloc[x] == '13':
        dataTable['periodtype'].iloc[x] = '01'
        dataTable['period'].iloc[x] = '00'
    
    if dataTable['seasonal'].iloc[x] == 'S':
        dataTable['adjusted'].iloc[x] = '1'
    
    if dataTable['footnote_codes'].iloc[x] == 'P':
        dataTable['prelim'].iloc[x] = '1'
    
    if dataTable['ratelevel_code'].iloc[x] == 'L':
        dataTable['value'].iloc[x] = dataTable['value'].iloc[x]*1000

# filter tables for areas and years
dataTable['include'] = 0
for y in range(max(dataTable.index)+1):
    if dataTable['stfips'].iloc[y] in states and dataTable['periodyear'].iloc[y] in years and dataTable['period'].iloc[y] != '00':
        dataTable['include'].iloc[y] = 1
dataTable = dataTable[dataTable['include']==1]

tempTable = dataTable[['stfips','areatype','area','periodyear','periodtype','period','indcodetype','industry_code','adjusted', 'joltstypecode','sizeclasscode','prelim','ratelevel_code','value']]
outputTable = tempTable.pivot(index=['stfips','areatype','area','periodyear','periodtype','period','indcodetype','industry_code','adjusted', 'joltstypecode','sizeclasscode','prelim'],columns=['ratelevel_code'],values=['value'])

outputTable = outputTable.reset_index()
outputTable.columns = ['_'.join(str(s).strip() for s in col if s) for col in outputTable.columns]
outputTable = outputTable.rename({'industry_code':'indcode','value_L':'value', 'value_R':'rate'})


industryOutput = pd.DataFrame(outputTable['stfips'].drop_duplicates())
industryOutput['codetype'] ='20'
industryLookup['codetype'] ='20'
industryOutput = industryOutput.set_index('codetype').join(industryLookup.set_index('codetype'), rsuffix='_right')
industryOutput = industryOutput.reset_index()
industryOutput['code'] = industryOutput['industry_code']
industryOutput['codetitle'] = industryOutput['industry_text']


# filter tables for areas and years

industryOutput = industryOutput[['stfips','codetype','code','codetitle']]
industryOutput['include'] = 0
for z in range(max(industryOutput.index)+1):
    if industryOutput['stfips'].iloc[z] in states :
        industryOutput['include'].iloc[z] = 1




# output the file
with open('jolts.xlsx','wb') as f:
	outputTable.to_excel('jolts.xlsx',index=True)

with open('jolts_industries.xlsx','wb') as f:
	industryOutput[industryOutput['include']==1].to_excel('jolts_industries.xlsx',index=True)



print("Finished!")