#' Wildfire Likelihood Tests

#Load packages
library(tidyverse)
library(here)
library(devtools)
library(testthat)

#Source land_conditions function
source(here("wildfire_likelihood.R"))

#Test 1: Test that the Wildfire Likelihood function checks for errors
test_that("wildfire_likelihood_checks_errors", {
  #Look for error if climate fire probability is more than 100%
  expect_error(wildfire_likelihood(climate_fire_probability = 101,
                                   land_fire_probability = 20))
  #Look for error if climate fire probability is negative
  expect_error(wildfire_likelihood(climate_fire_probability = -1,
                                   land_fire_probability = 20))
  #Look for error if climate fire probability is not a number
  expect_error(wildfire_likelihood(climate_fire_probability = "banana",
                                   land_fire_probability = 20))
  #Look for error if land fire probability is more than 100%
  expect_error(wildfire_likelihood(climate_fire_probability = 20,
                                   land_fire_probability = 101))
  #Look for error if land fire probability is negative
  expect_error(wildfire_likelihood(climate_fire_probability = 20,
                                   land_fire_probability = -1))
  #Look for error if land fire probability is not a number
  expect_error(wildfire_likelihood(climate_fire_probability = 20,
                                   land_fire_probability = "banana"))
})

#' Test 2: Test that increasing climate-based or land-based fire probability
#' increases overall fire probability, and that outputs are reasonable

test_that("wildfire_likelihood_works", {
#Check that higher climate-based probability -> higher overall probability
  expect_true(wildfire_likelihood(climate_fire_probability = 21, 
                                  land_fire_probability = 10) >
                wildfire_likelihood(climate_fire_probability = 20, 
                                    land_fire_probability = 10))
#Check that higher land-based probability -> higher overall probability
  expect_true(wildfire_likelihood(climate_fire_probability = 10, 
                                  land_fire_probability = 21) >
                wildfire_likelihood(climate_fire_probability = 10, 
                                    land_fire_probability = 20))
#Check that maximizing both inputs doesn't give an output greater than 100%
  expect_true(wildfire_likelihood(climate_fire_probability = 100, 
                                  land_fire_probability = 100) < 100)
})