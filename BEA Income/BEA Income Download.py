# Python package dependencies
from numpy import nan
import requests
import pandas as pd
from datetime import date

# define parameters
year = "2020" #exactly 1 year
table_names = ['CAINC1', 'SAINC1']
cregions = ['COUNTY', 'MSA']
sregions = ['STATE']
linecodes = ['1','2','3']

#function to hit API
def api_call(year, table_name, region, linecode):
	api_key = '' # insert API key here

	url = 'https://apps.bea.gov/api/data?&UserID='+api_key+'&method=GetData&datasetname=Regional&TableName='+table_name+'&GeoFIPS='+region+'&linecode='+linecode+'&Year='+year+'&ResultFormat=JSON'

	request_response = requests.get(url)
	request_json = request_response.json()
	return request_json

# extract data from API for all selections
fullTable = pd.DataFrame()

for x in table_names:
	table_name = x
	for z in linecodes:
		linecode = z
		if table_name == 'CAINC1':
			for y in cregions:
				regiontype = y
				request_json = api_call(year, table_name, regiontype, linecode)
				output = pd.DataFrame(request_json['BEAAPI']['Results']['Data'])
				output['regiontype'] = regiontype
				fullTable = fullTable.append(output, ignore_index=True)
		if table_name == 'SAINC1':
			for y in sregions:
				regiontype = y
				request_json = api_call(year, table_name, regiontype, linecode)
				output = pd.DataFrame(request_json['BEAAPI']['Results']['Data'])
				output['regiontype'] = regiontype
				fullTable = fullTable.append(output, ignore_index=True)



# assign WID fields
fullTable['linecode'] = fullTable['Code'].str[7:]
fullTable['stfips'] = fullTable['GeoFips'].str[:2]
fullTable['periodyear'] = fullTable['TimePeriod']
fullTable['periodtype'] = '01'
fullTable['period'] = '00'
fullTable['incsource'] = '3'

# change units
for x in range(max(fullTable.index)):
	fullTable['DataValue'].iloc[x] = fullTable['DataValue'].iloc[x].replace(',','')

	if fullTable['DataValue'].iloc[x] =='(NA)':
		fullTable['DataValue'].iloc[x] = nan
	else:
		if fullTable['CL_UNIT'].iloc[x] =='Thousands of dollars':
			fullTable['DataValue'].iloc[x] = float(fullTable['DataValue'].iloc[x].replace(',',''))*1000
		elif fullTable['CL_UNIT'].iloc[x] =='Millions of dollars':
			fullTable['DataValue'].iloc[x] = int(round(float(fullTable['DataValue'].iloc[x].replace(',',''))*1000000,0))

# convert source region type to WID areatype
fullTable['areatype']=''
fullTable['rankgroup']=''
for x in range(max(fullTable.index)+1):
	if fullTable['regiontype'].iloc[x] in ['STATE','MSA']:
		fullTable['rankgroup'].iloc[x] = '99'
	else:
		fullTable['rankgroup'].iloc[x] = fullTable['stfips'].iloc[x]
for x in range(max(fullTable.index)+1):
	#if fullTable['GeoName'].iloc[x].find('Census Area')>=0:
		#fullTable['areatype'].iloc[x] ='99'
	if fullTable['regiontype'].iloc[x] =='COUNTY':
		fullTable['areatype'].iloc[x] ='04'
	elif fullTable['regiontype'].iloc[x] =='MSA':
		fullTable['areatype'].iloc[x] ='31'
	elif fullTable['regiontype'].iloc[x] =='MIC':
		fullTable['areatype'].iloc[x] ='32'
	elif fullTable['regiontype'].iloc[x] =='CSA':
		fullTable['areatype'].iloc[x] ='34'
	elif fullTable['regiontype'].iloc[x] =='STATE' and fullTable['GeoFips'].iloc[x] != '00000':
		fullTable['areatype'].iloc[x] ='01'
	else:
		fullTable['areatype'].iloc[x] ='00'

fullTable['joincode']=fullTable['rankgroup']+fullTable['areatype']+fullTable['GeoFips']

# bring in WID area codes
bea_geog = pd.read_excel('bea_geog.xls', dtype={'GeoFips': str, 'GeoName': str, 'regiontype': str, 'stfips': str,'areatype': str, 'area': str})
bea_geog['rankgroup'] = ''
for m in range(max(bea_geog.index)+1):
	if bea_geog['areatype'].iloc[m] in ['31','01','00']:
		bea_geog['rankgroup'].iloc[m] = '99'
	else:
		bea_geog['rankgroup'].iloc[m] = bea_geog['stfips'].iloc[m]
bea_geog['joincode'] = bea_geog['rankgroup']+bea_geog['areatype']+bea_geog['GeoFips']

fullTable = fullTable.drop_duplicates().set_index('joincode').join(bea_geog.set_index('joincode'), lsuffix='_orig', how='inner')

# pivot line numbers
newTable = fullTable.pivot(index=['rankgroup','GeoFips','GeoName','stfips','regiontype','areatype', 'area', 'periodyear', 'periodtype', 'period', 'incsource'], columns=['linecode'], values=['DataValue'])


# unpivot by income type
anotherTable = newTable['DataValue']

outputTable = anotherTable[['1','2']]
outputTable = outputTable.rename(columns={'1':'income','2':'population'})
outputTable['inctype'] = '01'

outputTable2 = anotherTable[['3','2']]
outputTable2 = outputTable2.rename(columns={'3':'income','2':'population'})
outputTable2['inctype'] = '02'

outputTable = outputTable.append(outputTable2)
outputTable['population'] = outputTable['population'].astype(float)
outputTable['income'] = outputTable['income'].astype(float)


# assign today as releasedate
outputTable['releasedate'] = str(date.today().strftime("%Y%m%d"))

#fix column types
outputTable = outputTable.reset_index()

#calculate incrank
# outputTable['rankvar'] = outputTable['rankgroup']+outputTable['areatype']+outputTable['inctype']
# outputTable['incrank'] = outputTable.groupby(['rankvar'])['income'].rank()
# outputTable[outputTable['area']=='000329']
outputTable['incrank'] = outputTable.groupby(['rankgroup','areatype', 'inctype'])['income'].rank(method='dense', ascending=False)


FileName = 'beaincome'+year+'.xlsx'

with open(FileName, 'w') as f:
  outputTable[['stfips','areatype','area','periodyear','periodtype','period','inctype','incsource','income','incrank','population','releasedate']].to_excel(FileName,index=False)

print('Finished!')