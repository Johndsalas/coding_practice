# Create a spark data frame that contains your favorite programming languages.

# The name of the column should be language
# View the schema of the dataframe
# Output the shape of the dataframe
# Show the first 5 records in the dataframe


# imports
import pyspark
import pandas as pd
import numpy as np

# set up spark environment
spark = pyspark.sql.SparkSession.builder.getOrCreate()

# create pandas dataframe
languages = ["python", "C", "Kotlin", "Java", "Go"]

df = pd.DataFrame({"language":languages})

# convert to spark dataframe
df = spark.createDataFrame(df)

df.show()

print((df.count(), len(df.columns)))

# Load the mpg dataset as a spark dataframe
# Create 1 column of output that contains a message like the one below:
# The 1999 audi a4 has a 4 cylinder engine.
# For each vehicle.


import pyspark
from pydataset import data
from pyspark.sql.functions import *

mpg = spark.createDataFrame(data("mpg"))

mpg.show()

# the YEAR MANUFACTUERER MODEL has a CYL cylinder engine.
mpg.select(
            concat( 
                    lit("The "), 
                    col("Year"),
                    lit(" "),
                    col("manufacturer"),
                    lit(" "),
                    col("model"),
                    lit(" has a "),
                    col("cyl"),
                    lit(" cylinder engine.")
                    ).alias("Car Summery")
                   ).show(20, False)
        

# Transform the trans column so that it only contains either manual or auto.

mpg = mpg.withColumn("trans",regexp_extract( "trans",r"^(\w+)",1).alias("Trans"))

mpg.show()




# Load the tips dataset as a spark dataframe.


import pyspark
from pydataset import data
from pyspark.sql.functions import *

spark = pyspark.sql.SparkSession.builder.getOrCreate()

df = spark.createDataFrame(data("tips"))

# What percentage of observations are smokers?

# Create a column that contains the tip percentage

df.select(round(df.tip/df.total_bill,2).alias("Tip Percentage")).show()
# Calculate the average tip percentage for each combination of sex and smoker.




# Use the seattle weather dataset referenced in the lesson to answer the questions below.
# Convert the temperatures to farenheight.
# Which month has the most rain, on average?
# Which year was the windiest?
# What is the most frequent type of weather in January?
# What is the average high and low tempurature on sunny days in July in 2013 and 2014?
# What percentage of days were rainy in q3 of 2015?
# For each year, find what percentage of days it rained (had non-zero precipitation).