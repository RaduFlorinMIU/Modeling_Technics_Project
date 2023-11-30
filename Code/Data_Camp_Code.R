install.packages("pkgcond")
library(readxl)
suppressPackageStartupMessages(library(pkgcond))

suppress_conditions(source("librs_and_funcs.R"))

unicorns <- read_excel("../DataSets/CB-Insights_Global-Unicorn-Club_2023.xlsx")
