# Python package dependencies
from numpy import nan
from pandas.core.frame import DataFrame
import requests
import pandas as pd

year = "2022" #exactly 1 acs year
stfips_df = pd.read_csv ('all_stfips.csv', dtype = {'stfips': str})
stfips = list(stfips_df['stfips']) #more than a few will result in a very large dataset and very slow processing


def api_call(statefips, year, acslen, tabletype, group, regiontype):

    api_key = "" #@param {type:"string"}

    ##create syntax for table types
    if tabletype == "subject":
        typestring = "/subject?get=NAME,"
    elif tabletype == "dataprofile":
        typestring = "/profile?get="
    elif tabletype == "detailed":
        typestring = "?get=NAME,"
    elif tabletype == "comparison":
        typestring = "/cprofile?get="

    #print(typestring)

    ##create syntax for commonly used regions
    if regiontype == "state":
        regionstring = "&for=state:"+statefips
    elif regiontype == "us":
        regionstring = "&for=us:*"
    elif regiontype == "allstates":
        regionstring = "&for=state:*"
    elif regiontype == "nationalcounties":
        regionstring = "&for=county:*"
    elif regiontype == "county":
        regionstring = "&for=county:*&in=state:"+statefips
    elif regiontype == "tract":
        regionstring = "&for=tract:*&in=state:"+statefips
    elif regiontype == "place":
        regionstring = "&for=place:*&in=state:"+statefips
    elif regiontype == "city":
        regionstring = "&for=county%20subdivision:*&in=state:"+statefips
    elif regiontype == "metro":
        regionstring = "&for=metropolitan%20statistical%20area/micropolitan%20statistical%20area:*"
    elif regiontype == "tribalarea": 
        regionstring = "&for=american%20indian%20area/alaska%20native%20area/hawaiian%20home%20land:*"


    url = 'https://api.census.gov/data/'+year+'/acs/acs'+acslen+typestring+'group('+group+')'+regionstring+'&key='+api_key
    print(url)
    headers = {
        'X-API-Key': api_key,
        'Content-Type': 'application/json'
    }

    request_response = requests.get(url)
    if 200 == request_response.status_code:
        request_json = request_response.json()
        return request_json
    if 204 == request_response.status_code:
        request_json = 'z'
        return request_json
    #data is downloaded and available



#import stfips codes and variable names
df_stfips = pd.read_csv('all_stfips.csv', quotechar='"', header=0, dtype={"stfips": str})
df_stfips = df_stfips[df_stfips['stfips'].isin(stfips)]

varnames_list = ['GEO_ID','NAME','state','periodyear','acslen','regiontype','income','population']
detaileds = ['B01001','B19013']
regions = ['state']##['tribalarea','city','metro','us','state','county', 'place']#'us','tribalarea',msa do not take stfips and will be duplicated for all states requested
list_acslen = [5]

def extract_data(group):
    appendOutput = pd.DataFrame()
    for x in df_stfips['stfips']:
        statefips = x
        for y in list_acslen:
            acslen = str(y) #5 or 1
            tabletype = "detailed" #subject, dataprofile, detailed, comparison.  must match group specification
            for z in regions:
                regiontype = z
                print(regiontype)
                df = pd.DataFrame.from_records(api_call(statefips, year, acslen, tabletype, group, regiontype))
                if len(df.iloc[0]) > 1:
                    titles = df.iloc[0]
                    df['periodyear'] = year
                    df['acslen'] = acslen
                    df['regiontype'] = regiontype
                    appendOutput = pd.concat([df,appendOutput], ignore_index=True)
    appendOutput = appendOutput.rename(columns=titles[1:])
    tableoutput = appendOutput[appendOutput[0] != 'NAME']
    return tableoutput

# execute the data call for each table needed
dfB01001 = extract_data('B01001')
dfB19013 = extract_data('B19013')

# create a meaningful identifier for joins
dfB01001['ident'] = dfB01001['periodyear'] + dfB01001['acslen'] + dfB01001['GEO_ID']
dfB19013['ident'] = dfB19013['periodyear'] + dfB19013['acslen'] + dfB19013['GEO_ID']


# join all tables
combinedDf = dfB01001.drop_duplicates().set_index('ident').join(dfB19013.drop_duplicates().set_index('ident'), rsuffix='_19')
# extract relevant fields
outputDf = combinedDf[['GEO_ID','NAME','state','periodyear','acslen','regiontype','B19013_001E','B01001_001E']]
# rename with WID field names
outputDf.columns = outputDf.columns[:0].tolist() + varnames_list

# add descriptive fields
outputDf['period']='00'
outputDf['periodtype'] = '01'
outputDf['incsource'] = '1'
outputDf['inctype'] = '03'
outputDf['releasedate'] = str(int(year)+1)
for z in range(outputDf['GEO_ID'].count()): 
    if outputDf['acslen'].iloc[z] == '5':
        outputDf['periodtype'].iloc[z] = '60'
areatypes = ['00','01','04','11','20','31','32','34','51']

# bring in area crosswalk
wid_geog = pd.read_excel('WIDxGeoID.xlsx',dtype={'Stfips': str, 'Areatype': str, 'area': str})

# extract WID areas
outputDf2 = outputDf.set_index('GEO_ID').join(wid_geog.set_index('GEOID'), rsuffix='_geog', how='inner')
outputDf3 = outputDf2[['Stfips','Areatype','area','periodyear','periodtype','period','inctype','incsource','income','population','releasedate']]

outputDf3['incrank'] = outputDf3.groupby(['Stfips','Areatype'])['income'].rank('max')

# export file
FileName = 'income'+year+'.xlsx'

with open(FileName, 'w') as f:
  outputDf3[['Stfips','Areatype','area','periodyear','periodtype','period','inctype','incsource','income','incrank','population','releasedate']].to_excel(FileName,index=False)


print('Finished!')