# This file uses City, Rent and Price_sqft table from mydb.
# Pandas is used in this code to get the operations done.
# This file answers the questions from Question 1 which 
# asks to find the summary of the dataset

#Importing Libraries
import mysql.connector
import pandas
from pandas import DataFrame

##Create connection to the database
cnx = mysql.connector.connect(user='scott', password="pwd123", database='mydb') 

##initialize cursor to iterate data

city_cursor = cnx.cursor() # City Cursor
rent_cursor = cnx.cursor()
sqft_cursor = cnx.cursor() # Sqft Cursor
output = []

#Queries to fetch the data
city_query = ("SELECT * from City")
rent_query = ("SELECT * from Rent;")
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

# Execute Query to fetch price sqft data
rent_cursor.execute(rent_query)

# Fetching data and column names for price sqft data
rent_field_names = [i[0] for i in rent_cursor.description]
rent_get_data = [xx for xx in rent_cursor]
rent_cursor.close()

#Getting city data in dataframe
city_df=DataFrame(city_get_data)
city_df.columns = city_field_names

#Getting Rent data in dataframe
rent_df=DataFrame(rent_get_data)
rent_df.columns = rent_field_names

#Getting Price sqft data in dataframe
sqft_df=DataFrame(sqft_get_data)
sqft_df.columns = sqft_field_names

#Merging the data
city_rent_merge=pandas.merge(city_df,rent_df,on='CityCode')
city_sqft_merge=pandas.merge(city_df,sqft_df,on='CityCode')

#Transposing the data
pd_city_rent=pandas.melt(city_rent_merge, id_vars=["CityCode","CityName","Metro","County","State","PopulationRank"]) 
pd_city_sqft=pandas.melt(city_sqft_merge, id_vars=["CityCode","CityName","Metro","County","State","PopulationRank"]) 

#Printing the summary
print("Count of Cities")
print(len(city_df.groupby(["CityCode"])),"\n")
print("Count of States")
print(len(city_df.groupby(["State"])),"\n")
print("Count of Metros")
print(len(city_df.groupby(["Metro"])),"\n")
print("Count of Counties")
print(len(city_df.groupby(["County"])),"\n")
print("State wise Mean of Rent dataset")
print(pd_city_rent.groupby(["State"])["value"].mean(),"\n")
print("State Wise Mean of Price_Sqft dataset")
print(pd_city_sqft.groupby(["State"])["value"].mean())

#Close cursor and connection
city_cursor.close()
cnx.close()


