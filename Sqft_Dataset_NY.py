# This file uses City and Price_sqft table from mydb.
# Pandas is used in this code to get the operations done.
# This file answers the questions from Question 3 - Question 7

#Importing Libraries
import mysql.connector
import pandas
from pandas import DataFrame

##Create connection to the database
cnx = mysql.connector.connect(user='scott', password="pwd123", database='mydb') 

##initialize cursor to iterate data
city_cursor = cnx.cursor() # City Cursor
sqft_cursor = cnx.cursor() # Sqft Cursor
output = [] 

##Master select query which returns complete data to be filtered
city_query = ("SELECT * from City")
sqft_query = ("SELECT * from Price_sqft")

# Execute Query to fetch city data
city_cursor.execute(city_query)

# Fetching data and column names for City data
city_field_names = [i[0] for i in city_cursor.description]
city_get_data = [xx for xx in city_cursor]
city_cursor.close()

# Execute Query to fetch price sqft data
sqft_cursor.execute(sqft_query)

# Fetching data and column names for price sqft data
sqft_field_names = [i[0] for i in sqft_cursor.description]
sqft_get_data = [xx for xx in sqft_cursor]
sqft_cursor.close()

# Getting city data in dataframe 
city_data_for_join_df = DataFrame (city_get_data)
city_data_for_join_df.columns = city_field_names

city_df=DataFrame(city_get_data)
city_df.columns = city_field_names

# Getting city sqft data in dataframe
sqft_df = DataFrame(sqft_get_data)
sqft_df.columns = sqft_field_names

# joining city and city sqft data frame
joined_city_sqft=city_data_for_join_df.join(sqft_df.set_index('CityCode'), on='CityCode')

# Transposing the data
master_melted_dataset_df=pandas.melt(joined_city_sqft, id_vars=["CityCode","CityName","Metro","County","State","PopulationRank"])

#Question3
print("Question 3")
full_average=master_melted_dataset_df["value"].mean()
print("Average of Price Sqft Dataset")
print(full_average, "\n")
print("Maximum of Price Sqft Dataset")
print(master_melted_dataset_df["value"].max(), "\n")
print("Minimum of Price Sqft Dataset")
print(master_melted_dataset_df["value"].min(), "\n")

#Question4
print("Question 4")
#Condition to filter State == NY
nyst = master_melted_dataset_df["State"]=='NY'

#Applying nyst condition to get only NY dataset
ny_df=master_melted_dataset_df[nyst]
print("Average price sqft of NewYork City")	
ny_average=ny_df["value"].mean()
print(ny_average, "\n")

#question 5
#question for complete data avg for metro > complete data avg]
print("Question 5")

#question for ny data avg for metro > ny data avg
#Condition to find price sqft data for NY metros with sqft > NY sqft average
ny_metro_avg=ny_df["value"]>ny_average
#Condition to eliminate empty metro value
empty_metro=ny_df["Metro"]!=''
#Applying conditions
ny_metro_pd=ny_df[ny_metro_avg & empty_metro]

print("NY Metro Count having sqft price greater than NY average")
#printing the count of unique metros
print(len(ny_metro_pd.Metro.unique()),"\n")


#Question 6
print("Question 6")
ny_metro_pd=ny_metro_pd.Metro.unique()

#Filtering the cities from city dataframe having sqft > NY avg
names_df=city_df[city_df["Metro"].isin(ny_metro_pd)==True]
 print("City Names having sqft price greater that NY average")

#condition to filter state == NY
ny_filter=names_df["State"]=="NY"

#Applying condition
final_df=names_df[ny_filter]

#sorting the dataframe
final_df=final_df.sort_values(['Metro','CityName'],ascending=[1,0])

#printing the data
print(final_df.loc[:,'CityName':'Metro'],"\n")

#Question 7
print("Question 7")

#Condition s
NY_State_increase=master_melted_dataset_df['State']=='NY'
filter_increase_first=master_melted_dataset_df['variable']=='Sep2015'
filter_increase_last=master_melted_dataset_df['variable']=='Sep2016'

#Applying conditions to filter Sep 2015 data for NY state
question7_df_first=master_melted_dataset_df[filter_increase_first & NY_State_increase]

#Applying conditions to filter Sep 2016 data for NY state
question7_df_last=master_melted_dataset_df[filter_increase_last & NY_State_increase]

#calculating the mean to bring the dataset at same level for comparison.
question7_df_first_grp=question7_df_first.groupby(['Metro'])['value'].mean().reset_index()
question7_df_last_grp=question7_df_last.groupby(['Metro'])['value'].mean().reset_index()

#Joining the dataframes to calculate the difference
join_2015_2016=pandas.merge(question7_df_first_grp,question7_df_last_grp,on=['Metro'],how='inner',suffixes=['_2015', '_2016'])

remove_empty_metro=join_2015_2016["Metro"]!=''
join_2015_2016=join_2015_2016[remove_empty_metro]

join_2015_2016['increase']=join_2015_2016['value_2016'].sub(join_2015_2016['value_2015'], axis=0)

#Calculating the max of the difference
question7_df_max_diff=join_2015_2016['increase'].max()

increase_2015_2016_filter=join_2015_2016['increase']==question7_df_max_diff

final_increase=join_2015_2016[increase_2015_2016_filter]
print(final_increase)

##Close connections
 cnx.close()
