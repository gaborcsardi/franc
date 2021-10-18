library(testthat)
library(franc)

if (Sys.getenv("NOT_CRAN") == "true") test_check("franc")
