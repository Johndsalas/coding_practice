# imports
import pyspark
import pyspark.sql.functions as F
import pandas as pd
import numpy as np

# begin spark session
spark = pyspark.sql.SparkSession.builder.getOrCreate()

# set random seed
np.random.seed(456)

# create pandas dataframe using pandas and numpy
pandas_dataframe = pd.DataFrame(dict(n=np.arange(20), group=np.random.choice(list("abc"), 20)))

# change pandas dataframe to spark dataframe
df = spark.createDataFrame(pandas_dataframe)

# show dataframe
#df.show(5)

# show discribe
#df.describe().show()

# import data from pydataset and convert to pandas dataframe
from pydataset import data

mpg = spark.createDataFrame(data("mpg"))

#mpg.show(5)

# display hwy, cty, and model columns from mpg data set
mpg.select(mpg.hwy,mpg.cty,mpg.model).show(15)

# add 1 to all values in a column
mpg.select(mpg.hwy,mpg.hwy + 1).show(5)

# rename an column
mpg.select(mpg.hwy.alias("highway_milage")).show(5)

# storing column objects
col1 = mpg.hwy.alias("highway_milage")
col2 = (mpg.hwy / 2).alias("Highway_milage_haved")
mpg.select(col1,col2).show(5)

# other ways to create columns
from pyspark.sql.functions import col, expr

ave_column = (col("hwy") + col("cty")) / 2

mpg.select(
            col("hwy").alias("highway_mileage"),
            mpg.cty.alias("city_mileage"),
            ave_column.alias("avg_mileage"),
            ).show(5)

# using expr

mpg.select(
            expr("hwy"),  # the same as `col`
            expr("hwy + 1"),  # an arithmetic expression
            expr("hwy AS highway_mileage"),  # using an alias
            expr("hwy + 1 AS highway_incremented"),  # a combination of the above
            ).show(5)

# using SQL queries on spark dataframes 

# register table with spark
mpg.createOrReplaceTempView("mpg")

# enter SQL query

spark.sql(
"""
SELECT hwy, cty, (hwy + cty) / 2 AS avg
FROM mpg
""").show(10)

# veiw column data types

mpg.dtypes

mpg.printSchema()

# cast data as another type
# if value not convertable then it will null

mpg.select(mpg.hwy.cast("string")).printSchema()

# Basic Built-in Functions
# We've used the col and expr functions, but there are many other functions within the pyspark.sql.functions module, all of which operate on pyspark dataframe columns. Here we'll demonstrate several:

# concat: to concatenate strings
# sum: to sum a group
# avg: to take the average of a group
# min: to find the minimum
# max: to find the maximum
# Note that importing the sum function directly will override the built-in sum function. 
# This means you will get an error if you try to sum a list of numbers, 
# because sum will refernce the pyspark sum function, which works with pyspark dataframe columns, 
# while the built-in sum function works with lists of numbers. 
# The same holds true for the built in min and max functions.

# import functions
#from pyspark.sql.functions import concat, sum, avg, min, max, count, mean


from pyspark.sql.functions import *

# using functions

mpg.select(
            (sum(mpg.hwy) / count(mpg.hwy)).alias("average_1"),
            avg(mpg.hwy).alias("average_2"),
            min(mpg.hwy),
            max(mpg.hwy),
            ).show()

mpg.select(concat(mpg.manufacturer, mpg.model)).show(5)

# In order to use a string literal as part of our select, we'll need to use the lit function, 
# otherwise spark will try to resolve our string as a column.

from pyspark.sql.functions import lit

mpg = spark.createDataFrame(data("mpg"))
mpg.select(concat(mpg.cyl, lit(" cylinders"))).show(5)

# string manipulation

from pyspark.sql.functions import regexp_extract, regexp_replace

# create dataframe

textdf = spark.createDataFrame(
    pd.DataFrame(
        {
            "address": [
                "600 Navarro St ste 600, San Antonio, TX 78205",
                "3130 Broadway St, San Antonio, TX 78209",
                "303 Pearl Pkwy, San Antonio, TX 78215",
                "1255 SW Loop 410, San Antonio, TX 78227",
            ]
        }
    )
)

textdf.show(truncate=False)

# The regexp_extract function lets us specify a regular expression with at least one capture group,
#  and create a new column based on the contents of a capture group.

textdf.select(
    "address",
    regexp_extract("address", r"^(\d+)", 1).alias("street_no"),
    regexp_extract("address", r"^\d+\s([\w\s]+?),", 1).alias("street"),
).show(truncate=False)

# In addition to regexp_extract, regexp_replace lets us make substitutions based on a regular expression.

textdf.select(
    "address",
    regexp_replace("address", r"^.*?,\s*", "").alias("city_state_zip"),
).show(truncate=False)

# Spark provides two dataframe methods, .filter and .where, 
# which both allow us to select a subset of the rows of our dataframe.

mpg.filter(mpg.cyl == 4).where(mpg["class"] == "subcompact").show(20)

# The when function lets us specify a condition, and a value to produce if that condition is true:

from pyspark.sql.functions import when
mpg.select(
    mpg.hwy,
    when(mpg.hwy > 25, "good_mileage")
    .otherwise("bad_mileage")
    .alias("mpg_desc"),
).show(12)

# To specify multiple conditions, we can chain .when calls. 
# The first condition that is met will be the value that is used, and if none of the conditions are met t
# he value specified in the .otherwise will be used 
# (or null if you don't provide a .otherwise).

# Spark lets us sort the rows in our dataframe by one or multiple columns with two methods: .sort, and .orderBy. .sort and .orderBy 
# are aliases of each other and do the exact same thing. 
# Like other methods we've seen, .sort takes in a Column object or a string that is the name of a column.

mpg.sort(mpg.hwy).show(8)

from pyspark.sql.functions import asc, desc

mpg.sort(mpg.hwy.desc())
# is the same as
mpg.sort(col("hwy").desc())
# is the same as
mpg.sort(desc("hwy")).show(5)

# To aggregate our data by group, we can use the .groupBy method. 
# Like with .select, we can pass either Column objects or strings that are column names to .groupBy. 
# All of the expressions below are equivalent.

mpg.groupBy(mpg.cyl)
mpg.groupBy(col("cyl"))
mpg.groupBy("cyl")

#