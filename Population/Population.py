statefips = "27" #@param {type:"string"}
api_key = "" #@param {type:"string"}
year = "2021" #exactly 1 year
regiontype = 'allstates' #state, allstates

# Python package dependencies
import requests
import pandas as pd
from datetime import date

today = date.today()
releasedate = today.strftime("%Y%m%d")


##create syntax for table types
varlist = "POP_"+year+",RANK_POP_"+year+",NAME,STATE,GEO_ID"


#print(typestring)

##create syntax for commonly used regions
if regiontype == "state":
    regionstring = "&for=state:"+statefips
elif regiontype == "us":
    regionstring = "&for=us:*"
elif regiontype == "allstates":
    regionstring = "&for=state:*"

#print(regionstring)
    

url = 'https://api.census.gov/data/'+year+'/pep/population?get='+varlist+regionstring+'&key='+api_key
USurl = 'https://api.census.gov/data/'+year+'/pep/population?get='+varlist+"&for=us:*"+'&key='+api_key

headers = {
    'X-API-Key': api_key,
    'Content-Type': 'application/json'
}

request_response = requests.get(url)
#print(url)

request_json = request_response.json()
#data is downloaded and available

#convert to dataframe 
outputDf = pd.DataFrame.from_records(request_json)
outputDf['Areatype'] = '01'
#display(outputDf)

#add US record
request_responseUS = requests.get(USurl)
#print(url)

request_jsonUS = request_responseUS.json()
#data is downloaded and available

#convert to dataframe 
outputDfUs = pd.DataFrame.from_records(request_jsonUS)
outputDfUs.iloc[:, 5]='00'
outputDfUs['Areatype'] = '00'

outputDf = pd.concat([outputDf, outputDfUs], ignore_index=True)

# add descriptive fields
outputDf['Stfips'] = outputDf.iloc[:, 5]
outputDf['area'] = '000000'
outputDf['periodyear'] = year
outputDf['periodtype'] = '01'
outputDf['period']='00'
outputDf['popsource'] = '1'
outputDf['population'] = outputDf.iloc[:, 0]
outputDf['releasedate'] = releasedate
outputDf['checknum'] = list(map(lambda x: x.isdigit(), outputDf['population']))

rslt_df = outputDf[outputDf['checknum'] == True] 


# export file
FileName = 'populatn'+year+'.xlsx'

with open(FileName, 'w') as f:
  rslt_df[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','releasedate']].to_excel(FileName,index=False)

display(rslt_df[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','releasedate']])
