# Python package dependencies
from numpy import nan
from pandas.core.frame import DataFrame
import requests
import pandas as pd

year = "2020" #exactly 1 acs year
#stfips_df = pd.read_csv ('all_stfips.csv', dtype = {'stfips': str})
stfips = ['01'] #more than a few will result in a very large dataset and very slow processing

def api_call(statefips, year, acslen, tabletype, group, regiontype):

    api_key = "18cf07adaaec4c17e9e0cdcc987db5ec91746aaf" #@param {type:"string"}

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

varnames_list = ['GEO_ID','NAME','state','periodyear','acslen','regiontype','population','male','maleunder5','male5to9','male10to14','male15to17','male18to19','male20','male21','male22to24','male25to29','male30to34','male35to39','male40to44','male45to49','male50to54','male55to59','male60to61','male62to64','male65to66','male67to69','male70to74','male75to79','male80to84','male85xx','female','femaleunder5','female5to9','female10to14','female15to17','female18to19','female20','female21','female22to24','female25to29','female30to34','female35to39','female40to44','female45to49','female50to54','female55to59','female60to61','female62to64','female65to66','female67to69','female70to74','female75to79','female80to84','female85xx','white','black','naan','asian','pacisland','other','twomoreraces','hispanic','median','medianmale','medianfem','hispwhite','hispblack','hispnaan','hispasian','hisppacisl','hispother','hisp2race']
detaileds = ['B01001','B01001A','B01001B','B01001C','B01001D','B01001E','B01001F','B01001G','B01001I','B01002','B03002']
regions = ['metro','state']#['tribalarea','city','metro','us','state','county', 'place']#'us','tribalarea',msa do not take stfips and will be duplicated for all states requested
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
                    appendOutput = appendOutput.append(df, ignore_index=True)
    appendOutput = appendOutput.rename(columns=titles[1:])
    tableoutput = appendOutput[appendOutput[0] != 'NAME']
    return tableoutput

# execute the data call for each table needed
dfB01001 = extract_data('B01001')
dfB01001A = extract_data('B01001A')
dfB01001B = extract_data('B01001B')
dfB01001C = extract_data('B01001C')
dfB01001D = extract_data('B01001D')
dfB01001E = extract_data('B01001E')
dfB01001F = extract_data('B01001F')
dfB01001G = extract_data('B01001G')
dfB01001I = extract_data('B01001I')
dfB01002 = extract_data('B01002')
dfB03002 = extract_data('B03002')

# create a meaningful identifier for joins
dfB01001['ident'] = dfB01001['periodyear'] + dfB01001['acslen'] + dfB01001['GEO_ID']
dfB01001A['ident'] = dfB01001A['periodyear'] + dfB01001A['acslen'] + dfB01001A['GEO_ID']
dfB01001B['ident'] = dfB01001B['periodyear'] + dfB01001B['acslen'] + dfB01001B['GEO_ID']
dfB01001C['ident'] = dfB01001C['periodyear'] + dfB01001C['acslen'] + dfB01001C['GEO_ID']
dfB01001D['ident'] = dfB01001D['periodyear'] + dfB01001D['acslen'] + dfB01001D['GEO_ID']
dfB01001E['ident'] = dfB01001E['periodyear'] + dfB01001E['acslen'] + dfB01001E['GEO_ID']
dfB01001F['ident'] = dfB01001F['periodyear'] + dfB01001F['acslen'] + dfB01001F['GEO_ID']
dfB01001G['ident'] = dfB01001G['periodyear'] + dfB01001G['acslen'] + dfB01001G['GEO_ID']
dfB01001I['ident'] = dfB01001I['periodyear'] + dfB01001I['acslen'] + dfB01001I['GEO_ID']
dfB01002['ident'] = dfB01002['periodyear'] + dfB01002['acslen'] + dfB01002['GEO_ID']
dfB03002['ident'] = dfB03002['periodyear'] + dfB03002['acslen'] + dfB03002['GEO_ID']


# join all tables
combinedDf = dfB01001.drop_duplicates().set_index('ident').join(dfB01001A.drop_duplicates().set_index('ident'), rsuffix='_A').join(dfB01001B.drop_duplicates().set_index('ident'), rsuffix='_B').join(dfB01001C.drop_duplicates().set_index('ident'), rsuffix='_C').join(dfB01001D.drop_duplicates().set_index('ident'), rsuffix='_D').join(dfB01001E.drop_duplicates().set_index('ident'), rsuffix='_E').join(dfB01001F.drop_duplicates().set_index('ident'), rsuffix='_F').join(dfB01001G.drop_duplicates().set_index('ident'), rsuffix='_G').join(dfB01001I.drop_duplicates().set_index('ident'), rsuffix='_I').join(dfB01002.drop_duplicates().set_index('ident'), rsuffix='_2').join(dfB03002.drop_duplicates().set_index('ident'), rsuffix='_3')
# extract relevant fields
outputDf = combinedDf[['GEO_ID','NAME','state','periodyear','acslen','regiontype','B01001_001E','B01001_002E','B01001_003E','B01001_004E','B01001_005E','B01001_006E','B01001_007E','B01001_008E','B01001_009E','B01001_010E','B01001_011E','B01001_012E','B01001_013E','B01001_014E','B01001_015E','B01001_016E','B01001_017E','B01001_018E','B01001_019E','B01001_020E','B01001_021E','B01001_022E','B01001_023E','B01001_024E','B01001_025E','B01001_026E','B01001_027E','B01001_028E','B01001_029E','B01001_030E','B01001_031E','B01001_032E','B01001_033E','B01001_034E','B01001_035E','B01001_036E','B01001_037E','B01001_038E','B01001_039E','B01001_040E','B01001_041E','B01001_042E','B01001_043E','B01001_044E','B01001_045E','B01001_046E','B01001_047E','B01001_048E','B01001_049E','B01001A_001E','B01001B_001E','B01001C_001E','B01001D_001E','B01001E_001E','B01001F_001E','B01001G_001E','B01001I_001E','B01002_001E','B01002_002E','B01002_003E','B03002_013E','B03002_014E','B03002_015E','B03002_016E','B03002_017E','B03002_018E','B03002_019E']]
# rename with WID field names
outputDf.columns = outputDf.columns[:0].tolist() + varnames_list

# add descriptive fields
outputDf['period']='00'
outputDf['periodtype'] = '01'
outputDf['popsource'] = '3'
for z in range(outputDf['GEO_ID'].count()): 
    if outputDf['acslen'].iloc[z] == '5':
        outputDf['periodtype'].iloc[z] = '60'

# add calculated fields
outputDf['female15to19'] = outputDf['female15to17'].astype(float) + outputDf['female18to19'].astype(float)
outputDf['female20to24'] = outputDf['female20'].astype(float) + outputDf['female21'].astype(float) + outputDf['female22to24'].astype(float)
outputDf['female25to34'] = outputDf['female25to29'].astype(float) + outputDf['female30to34'].astype(float)
outputDf['female35to44'] = outputDf['female35to39'].astype(float) + outputDf['female40to44'].astype(float)
outputDf['female45to54'] = outputDf['female45to49'].astype(float) + outputDf['female50to54'].astype(float)
outputDf['female60to64'] = outputDf['female60to61'].astype(float) + outputDf['female62to64'].astype(float)
outputDf['female65to69'] = outputDf['female65to66'].astype(float) + outputDf['female67to69'].astype(float)
outputDf['female75to84'] = outputDf['female75to79'].astype(float) + outputDf['female80to84'].astype(float)
outputDf['female18xx'] = outputDf['female20to24'].astype(float) + outputDf['female18to19'].astype(float) + outputDf['female25to34'].astype(float) + outputDf['female35to44'].astype(float) + outputDf['female45to54'].astype(float) + outputDf['female55to59'].astype(float) + outputDf['female60to61'].astype(float) + outputDf['female62to64'].astype(float) + outputDf['female65to69'].astype(float) + outputDf['female70to74'].astype(float) + outputDf['female75to84'].astype(float) + outputDf['female85xx'].astype(float)
outputDf['female21xx'] = outputDf['female22to24'].astype(float) + outputDf['female21'].astype(float) + outputDf['female25to34'].astype(float) + outputDf['female35to44'].astype(float) + outputDf['female45to54'].astype(float) + outputDf['female55to59'].astype(float) + outputDf['female60to61'].astype(float) + outputDf['female62to64'].astype(float) + outputDf['female65to69'].astype(float) + outputDf['female70to74'].astype(float) + outputDf['female75to84'].astype(float) + outputDf['female85xx'].astype(float)
outputDf['female62xx'] = outputDf['female62to64'].astype(float) + outputDf['female65to69'].astype(float) + outputDf['female70to74'].astype(float) + outputDf['female75to84'].astype(float) + outputDf['female85xx'].astype(float)
outputDf['male15to19'] = outputDf['male15to17'].astype(float) + outputDf['male18to19'].astype(float)
outputDf['male20to24'] = outputDf['male20'].astype(float) + outputDf['male21'].astype(float) + outputDf['male22to24'].astype(float)
outputDf['male25to34'] = outputDf['male25to29'].astype(float) + outputDf['male30to34'].astype(float)
outputDf['male35to44'] = outputDf['male35to39'].astype(float) + outputDf['male40to44'].astype(float)
outputDf['male45to54'] = outputDf['male45to49'].astype(float) + outputDf['male50to54'].astype(float)
outputDf['male60to64'] = outputDf['male60to61'].astype(float) + outputDf['male62to64'].astype(float)
outputDf['male65to69'] = outputDf['male65to66'].astype(float) + outputDf['male67to69'].astype(float)
outputDf['male75to84'] = outputDf['male75to79'].astype(float) + outputDf['male80to84'].astype(float)
outputDf['male18xx'] = outputDf['male20to24'].astype(float) + outputDf['male18to19'].astype(float) + outputDf['male25to34'].astype(float) + outputDf['male35to44'].astype(float) + outputDf['male45to54'].astype(float) + outputDf['male55to59'].astype(float) + outputDf['male60to61'].astype(float)  + outputDf['male62to64'].astype(float) + outputDf['male65to69'].astype(float) + outputDf['male70to74'].astype(float) + outputDf['male75to84'].astype(float) + outputDf['male85xx'].astype(float)
outputDf['male21xx'] = outputDf['male22to24'].astype(float) + outputDf['male21'].astype(float) + outputDf['male25to34'].astype(float) + outputDf['male35to44'].astype(float) + outputDf['male45to54'].astype(float) + outputDf['male55to59'].astype(float) + outputDf['male60to61'].astype(float) + outputDf['male62to64'].astype(float) + outputDf['male65to69'].astype(float) + outputDf['male70to74'].astype(float) + outputDf['male75to84'].astype(float) + outputDf['male85xx'].astype(float)
outputDf['male62xx'] = outputDf['male62to64'].astype(float) + outputDf['male65to69'].astype(float) + outputDf['male70to74'].astype(float) + outputDf['male75to84'].astype(float) + outputDf['male85xx'].astype(float)
outputDf['tot10to14'] = outputDf['male10to14'].astype(float) + outputDf['female10to14'].astype(float)
outputDf['tot15to17'] = outputDf['male15to17'].astype(float) + outputDf['female15to17'].astype(float)
outputDf['tot15to19'] = outputDf['male15to19'].astype(float) + outputDf['female15to19'].astype(float)
outputDf['tot18to19'] = outputDf['male18to19'].astype(float) + outputDf['female18to19'].astype(float)
outputDf['tot18xx'] = outputDf['male18xx'].astype(float) + outputDf['female18xx'].astype(float)
outputDf['tot20'] = outputDf['male20'].astype(float) + outputDf['female20'].astype(float)
outputDf['tot20to24'] = outputDf['male20to24'].astype(float) + outputDf['female20to24'].astype(float)
outputDf['tot21'] = outputDf['male21'].astype(float) + outputDf['female21'].astype(float)
outputDf['tot21xx'] = outputDf['male21xx'].astype(float) + outputDf['female21xx'].astype(float)
outputDf['tot22to24'] = outputDf['male22to24'].astype(float) + outputDf['female22to24'].astype(float)
outputDf['tot25to29'] = outputDf['male25to29'].astype(float) + outputDf['female25to29'].astype(float)
outputDf['tot25to34'] = outputDf['male25to34'].astype(float) + outputDf['female25to34'].astype(float)
outputDf['tot30to34'] = outputDf['male30to34'].astype(float) + outputDf['female30to34'].astype(float)
outputDf['tot35to39'] = outputDf['male35to39'].astype(float) + outputDf['female35to39'].astype(float)
outputDf['tot35to44'] = outputDf['male35to44'].astype(float) + outputDf['female35to44'].astype(float)
outputDf['tot40to44'] = outputDf['male40to44'].astype(float) + outputDf['female40to44'].astype(float)
outputDf['tot45to49'] = outputDf['male45to49'].astype(float) + outputDf['female45to49'].astype(float)
outputDf['tot45to54'] = outputDf['male45to54'].astype(float) + outputDf['female45to54'].astype(float)
outputDf['tot50to54'] = outputDf['male50to54'].astype(float) + outputDf['female50to54'].astype(float)
outputDf['tot55to59'] = outputDf['male55to59'].astype(float) + outputDf['female55to59'].astype(float)
outputDf['tot5to9'] = outputDf['male5to9'].astype(float) + outputDf['female5to9'].astype(float)
outputDf['tot60to61'] = outputDf['male60to61'].astype(float) + outputDf['female60to61'].astype(float)
outputDf['tot60to64'] = outputDf['male60to64'].astype(float) + outputDf['female60to64'].astype(float)
outputDf['tot62to64'] = outputDf['male62to64'].astype(float) + outputDf['female62to64'].astype(float)
outputDf['tot62xx'] = outputDf['male62xx'].astype(float) + outputDf['female62xx'].astype(float)
outputDf['tot65to66'] = outputDf['male65to66'].astype(float) + outputDf['female65to66'].astype(float)
outputDf['tot65to69'] = outputDf['male65to69'].astype(float) + outputDf['female65to69'].astype(float)
outputDf['tot67to69'] = outputDf['male67to69'].astype(float) + outputDf['female67to69'].astype(float)
outputDf['tot70to74'] = outputDf['male70to74'].astype(float) + outputDf['female70to74'].astype(float)
outputDf['tot75to79'] = outputDf['male75to79'].astype(float) + outputDf['female75to79'].astype(float)
outputDf['tot75to84'] = outputDf['male75to84'].astype(float) + outputDf['female75to84'].astype(float)
outputDf['tot80to84'] = outputDf['male80to84'].astype(float) + outputDf['female80to84'].astype(float)
outputDf['tot85xx'] = outputDf['male85xx'].astype(float) + outputDf['female85xx'].astype(float)
outputDf['totunder5'] = outputDf['maleunder5'].astype(float) + outputDf['femaleunder5'].astype(float)
outputDf['onerace'] = outputDf['white'].astype(float) +outputDf['black'].astype(float) +outputDf['naan'].astype(float) +outputDf['asian'].astype(float) +outputDf['pacisland'].astype(float) +outputDf['other'].astype(float)

# bring in area crosswalk
wid_geog = pd.read_excel('WIDxGeoID.xlsx',dtype={'Stfips': str, 'Areatype': str, 'area': str})

# extract WID areas
outputDf2 = outputDf.set_index('GEO_ID').join(wid_geog.set_index('GEOID'), rsuffix='_geog', how='inner')

# export file
FileName = 'demographics'+year+'.xlsx'

with open(FileName, 'w') as f:
  outputDf2[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','female','male','median','medianmale','medianfem','totunder5','femaleunder5','maleunder5','tot5to9','female5to9','male5to9','tot10to14','female10to14','male10to14','tot15to19','female15to19','male15to19','tot15to17','female15to17','male15to17','tot18to19','female18to19','male18to19','tot20to24','female20to24','male20to24','tot20','female20','male20','tot21','female21','male21','tot22to24','female22to24','male22to24','tot25to34','female25to34','male25to34','tot25to29','female25to29','male25to29','tot30to34','female30to34','male30to34','tot35to44','female35to44','male35to44','tot35to39','female35to39','male35to39','tot40to44','female40to44','male40to44','tot45to54','female45to54','male45to54','tot45to49','female45to49','male45to49','tot50to54','female50to54','male50to54','tot55to59','female55to59','male55to59','tot60to64','female60to64','male60to64','tot60to61','female60to61','male60to61','tot62to64','female62to64','male62to64','tot65to69','female65to69','male65to69','tot65to66','female65to66','male65to66','tot67to69','female67to69','male67to69','tot70to74','female70to74','male70to74','tot75to84','female75to84','male75to84','tot75to79','female75to79','male75to79','tot80to84','female80to84','male80to84','tot85xx','female85xx','male85xx','tot18xx','female18xx','male18xx','tot21xx','female21xx','male21xx','tot62xx','female62xx','male62xx','onerace','white','black','naan','asian','pacisland','other','twomoreraces','hispanic','hispwhite','hispblack','hispnaan','hispasian','hisppacisl','hispother','hisp2race']].to_excel(FileName,index=False)

display(outputDf2[['Stfips','Areatype','area','periodyear','periodtype','period','popsource','population','female','male','median','medianmale','medianfem','totunder5','femaleunder5','maleunder5','tot5to9','female5to9','male5to9','tot10to14','female10to14','male10to14','tot15to19','female15to19','male15to19','tot15to17','female15to17','male15to17','tot18to19','female18to19','male18to19','tot20to24','female20to24','male20to24','tot20','female20','male20','tot21','female21','male21','tot22to24','female22to24','male22to24','tot25to34','female25to34','male25to34','tot25to29','female25to29','male25to29','tot30to34','female30to34','male30to34','tot35to44','female35to44','male35to44','tot35to39','female35to39','male35to39','tot40to44','female40to44','male40to44','tot45to54','female45to54','male45to54','tot45to49','female45to49','male45to49','tot50to54','female50to54','male50to54','tot55to59','female55to59','male55to59','tot60to64','female60to64','male60to64','tot60to61','female60to61','male60to61','tot62to64','female62to64','male62to64','tot65to69','female65to69','male65to69','tot65to66','female65to66','male65to66','tot67to69','female67to69','male67to69','tot70to74','female70to74','male70to74','tot75to84','female75to84','male75to84','tot75to79','female75to79','male75to79','tot80to84','female80to84','male80to84','tot85xx','female85xx','male85xx','tot18xx','female18xx','male18xx','tot21xx','female21xx','male21xx','tot62xx','female62xx','male62xx','onerace','white','black','naan','asian','pacisland','other','twomoreraces','hispanic','hispwhite','hispblack','hispnaan','hispasian','hisppacisl','hispother','hisp2race']])

print('Finished!')