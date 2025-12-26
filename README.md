# Tennessee_Retail_Sales_Data
Creates time-series dataframes from Tennessee Department of Revenue retail sales data.

The Tennessee Department of Revenue (“TNDoR”) provides monthly data on retails sales. Data are available at the county and state level.   The data is distributed in a series of Excel spreadsheets.  There are two scripts included in this repository. (1) A script to download TNDoR retail sales monthly data; and (2) a script that creates a time series from the data.

Retail sales for the following types of retail establishments are included in the data: (1) Building Materials;  (2) General Merchandise; (3) Food Stores; (4) Autos Boats, & Aircraft dealers; (5) Service Stations; (6) Apparel & Accessories;  (7) Furniture &Home Décor; (8) Eating & Drinking; (9) Other Retail. Total retail sales are also reported.  Spreadsheets contain monthly data and end-of-year or year-to-date data.


## Approach to creating data frames

The script to download the Excel files was written on December 24, 2025.  When new revenue data for 2025 is released, the script will throw an error.  The reader can simply update the link for the 2025 data to remove the error and incorporate additional data. If the destination directory for the downloaded files is changed, be sure to change it in script that creates the dataframes.

The script to create dataframes will produce four scripts for county monthly, county annual, statewide county, and statewide annual.  The data frame ‘error’ will provide information on whether there were issues processing data for a specific month.  The ‘error’ dataframe clearly shows which months are missing in current year data.  Initially, two data frames are created: rev_dat_monthly and rev_dat_annual.  These dataframes are filtered to create county-level and statewide dataframes.

The data is presented in a long format to make it easier to plot the data. The dataframes will have the following variables:

county
year
type
sales

The variable type captures the type of retail establishment where sales occur.  It takes on the following values:
total - Total retail sales
build_mat - Building Materials        
gen_merch - General Merchandise Stores         
food - Food Stores             
car_boat_aircraft - Car, Boat, & Aircraft Dealters
serv_stat - Service Stations         
apparel - Apparel & Accessories            
furniture - Furniture & Home Decor        
eat_drink - Eating & Drinking         
other - Other            

The final dataframes are:
rev_dat_ann_county 
rev_dat_ann_state 
rev_dat_mon_county 
rev_dat_mon_state 

