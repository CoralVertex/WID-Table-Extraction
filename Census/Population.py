# Python package dependencies
from numpy import nan
from pandas.core.frame import DataFrame
import requests
import pandas as pd
from API import *

year = "2016" #exactly 1 acs year
#stfips_df = pd.read_csv ('all_stfips.csv', dtype = {'stfips': str})
stfips = ['01']#,'02','04','05','06','08','09','10','11','12','13','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','44','45','46','47','48','49','50','51','53','54','55','56','72'] #more than a few will result in a very large dataset and very slow processing


def api_call(statefips, year, acslen, tabletype, group, regiontype):


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

varnames_list = ['GEO_ID','NAME','state','periodyear','acslen','regiontype','population','male','maleunder5','male5to9','male10to14','male15to17','male18to19','male20','male21','male22to24','male25to29','male30to34','male35to39','male40to44','male45to49','male50to54','male55to59','male60to61','male62to64','male65to66','male67to69','male70to74','male75to79','male80to84','male85xx','female','femaleunder5','female5to9','female10to14','female15to17','female18to19','female20','female21','female22to24','female25to29','female30to34','female35to39','female40to44','female45to49','female50to54','female55to59','female60to61','female62to64','female65to66','female67to69','female70to74','female75to79','female80to84','female85xx']
detaileds = ['B01001','B01001A','B01001B','B01001C','B01001D','B01001E','B01001F','B01001G','B01001I','B01002','B03002']
regions = ['us']#, 'state','county']#['tribalarea','city','metro','us','state','county', 'place']#'us','tribalarea',msa do not take stfips and will be duplicated for all states requested
list_acslen = [5]

def extract_data(group):
    appendOutput = pd.DataFrame()
    appendOutput['state'] = ''
    for x in df_stfips['stfips']:
        statefips = str(x)
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
                    appendOutput = pd.concat([appendOutput,df], ignore_index=True)
    appendOutput = appendOutput.rename(columns=titles[1:])
    tableoutput = appendOutput[appendOutput[0] != 'NAME']
    return tableoutput

# execute the data call for each table needed
dfB01001 = extract_data('B01001')

# extract relevant fields
outputDf = dfB01001[['GEO_ID','NAME','state','periodyear','acslen','regiontype','B01001_001E','B01001_002E','B01001_003E','B01001_004E','B01001_005E','B01001_006E','B01001_007E','B01001_008E','B01001_009E','B01001_010E','B01001_011E','B01001_012E','B01001_013E','B01001_014E','B01001_015E','B01001_016E','B01001_017E','B01001_018E','B01001_019E','B01001_020E','B01001_021E','B01001_022E','B01001_023E','B01001_024E','B01001_025E','B01001_026E','B01001_027E','B01001_028E','B01001_029E','B01001_030E','B01001_031E','B01001_032E','B01001_033E','B01001_034E','B01001_035E','B01001_036E','B01001_037E','B01001_038E','B01001_039E','B01001_040E','B01001_041E','B01001_042E','B01001_043E','B01001_044E','B01001_045E','B01001_046E','B01001_047E','B01001_048E','B01001_049E']].drop_duplicates()
# rename with WID field names
outputDf.columns = outputDf.columns[:0].tolist() + varnames_list

# add descriptive fields
outputDf['period']='00'
outputDf['periodtype'] = '01'
outputDf['popsource'] = '3'
outputDf['releasedate'] = '20240816'##changeme
for z in range(outputDf['GEO_ID'].count()): 
    if outputDf['acslen'].iloc[z] == '5':
        outputDf['periodtype'].iloc[z] = '60'


# bring in area crosswalk
wid_geog = pd.read_excel('WIDxGeoID.xlsx',dtype={'Stfips': str, 'Areatype': str, 'area': str})

# extract WID areas
outputDf2 = outputDf.set_index('GEO_ID').join(wid_geog.set_index('GEOID'), rsuffix='_geog', how='inner')

# export file
FileName = 'population'+year+'.xlsx'

with open(FileName, 'w') as f:
  outputDf2[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','releasedate']].to_excel(FileName,index=False)

display(outputDf2[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','releasedate']])

print('Finished!')