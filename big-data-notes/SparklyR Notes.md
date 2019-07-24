#SparklyR Notes


##Connect and  configure

```
library(sparklyr)

#The sparklyr way
# We need to override the spark.driver.maxResultSize
config <- spark_config()

config$spark.driver.maxResultSize <- "2G"

config$sparklyr.shell.driver-memory <- "8G"


config$sparklyr.shell.executor-memory <- "8G"

config$spark.yarn.executor.memoryOverhead <- "4g"

sc <- spark_connect(master = "yarn-client", config = config, version = '2.0.0')
```

Read Parquet data into Spark data frames

```
er_iperl <- spark_read_parquet(sc,"er_iperl", "/user/hadoop/AG/fma2_v13_featuredata.er_iPerl.parquet")

eea_iperl <- spark_read_parquet(sc,"eea_iperl", "/user/hadoop/AG/fma2_v13_featuredata.eea_iPerl.parquet")

edd_iperl <- spark_read_parquet(sc,"edd_iperl", "/user/hadoop/AG/fma2_v13_featuredata.edd_iPerl.parquet")
```

##SQL Query

Examples 

```
queryString <- "select meter_key, fldtimeofevent ,case when  fldlowfield  ==1 then 2 else 0 end as fldlowfield,case when fldmagnetictamper ==1 then 3 else 0 end as  fldmagnetictamper,case when fldemptypipenotlatched ==1 then 4 else 0 end as fldemptypipenotlatched,case when fldemptypipe ==1 then 5 else 0 end as fldemptypipe,case when fldleakdetectednotlatched ==1 then 6 else 0 end as fldleakdetectednotlatched from eea_iperl "

spark_session(sc) %>% invoke("sql",queryString )  %>% invoke("createOrReplaceTempView", "alarm_base")

#This collects to local df
#alarm_base <- DBI::dbGetQuery(sc,queryString)
```