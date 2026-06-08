#' Climate Fire Risk Probability Tests

library(tidyverse)
library(devtools)
library(testthat)
library(here)

source(here("climate_conditions.R"))

test_that("climate_conditions returns a numeric value", {
  
  result <- climate_conditions(
    temperature = 30,
    humidity = 25,
    wind_speed = 20
  )
  
  expect_true(is.numeric(result))
  expect_length(result, 1)
})

test_that("climate_conditions returns a probability between 0 and 1", {
  
  result <- climate_conditions(
    temperature = 30,
    humidity = 25,
    wind_speed = 20
  )
  
  expect_true(result >= 0)
  expect_true(result <= 1)
})
