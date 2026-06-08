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

test_that("hotter, drier, windier conditions increase climate fire probability", {
  
  low_risk <- climate_conditions(
    temperature = 20,
    humidity = 60,
    wind_speed = 5
  )
  
  high_risk <- climate_conditions(
    temperature = 38,
    humidity = 10,
    wind_speed = 45
  )
  
  expect_true(high_risk > low_risk)
})
