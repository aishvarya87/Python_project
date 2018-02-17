# This file uses City and Rent table from mydb.
# Pandas is used in this code to get the operations done.
# This file answers the question 2

#Importing Libraries
import mysql.connector
import pandas
from pandas import DataFrame

##Create connection to the database
cnx = mysql.connector.connect(user='scott', password="pwd123", database='mydb') 

##initialize cursor to iterate data
v_cursor = cnx.cursor()

##Master select query which returns complete data to be filtered
v_query = ("SELECT * from Rent;")

#Execute the query
v_cursor.execute(v_query)

#Fetching data and column names
field_names = [i[0] for i in v_cursor.description]
get_data = [xx for xx in v_cursor]

#Creating DataFrame
df = DataFrame(get_data)
df.columns = field_names

#Transposing the data
pd=pandas.melt(df, id_vars=["CityCode"], 
                  var_name="Date", value_name="Value")

#Question2
print("Question 2")
print("Mean of the Rent dataset")
print(pd["Value"].mean(),"\n")
print("Maximum of the Rent dataset")
print(pd["Value"].max(),"\n")
print("Minimum of the Rent dataset")
print(pd["Value"].min())

v_cursor.close()

##Close connections
cnx.close()