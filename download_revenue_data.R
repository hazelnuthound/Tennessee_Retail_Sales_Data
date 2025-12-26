##### Download Tennessee Department of Revenue Retail Sales Data
##### Data released quarterly, most recent file name will change
##### with new data released
##### Script will create a directory named "Data" in the existing 
##### home directory.  The "Data" directory is used as the data
##### source in the script that processes the data into a dataframe.

library(tidyverse)
library(httr)

a <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2024__Q4.xlsx"
b <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2023__Q4.xlsx"
c <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2022__Q4.xlsx"
d <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2021__Q4.xlsx"
e <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2020__Q4.xlsx"
f <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2019__Q4.xlsx"
g <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2018__Q4.xlsx"
h <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2017__Q4.xlsx"
i <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2016__Q4.xlsx"
j <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2015.xlsx"
k <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2014.xls"
l <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2013.xls"
m <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2012.xls"
n <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2011.xls"
o <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2010.xls"
p <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2009.xls"
q <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2008.xls"
r <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2007f.xls"
s <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2006d.xls"
t <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2005d.xls"
u <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2004e.xls"
v <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail_2003d.xls"
w <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2002.xls"

##### Most recent data as of 12-24-2025
aa <- "https://www.tn.gov/content/dam/tn/revenue/documents/statistics/retail/retail2025__Q2.xlsx"

objs <- mget(ls(), envir = .GlobalEnv)

##### Creates a directory name "Data" in the existing home directory.
if (!dir.exists("Data")) {dir.create("Data")}

download_data <- function(x) {
  fname <- stringr::str_extract(x, "(?<=/)[^/]+$")
  httr::GET(x, write_disk(fname, overwrite = TRUE))
}

lapply(objs, download_data)
