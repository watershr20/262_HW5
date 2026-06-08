#' Land Condition-Based Fire Probability Tests

#Load packages
library(tidyverse)
library(here)
library(devtools)
library(testthat)

#Source land_conditions function
source(here("land_conditions.R"))


#Test 1: Test that the land conditions function checks for errors

test_that("land_conditions_checks_errors", {
  
  #Look for error if fuel moisture is negative
  expect_error(land_conditions(fuel_moisture = -5, slope = 1))
  
  #Look for error if fuel moisture is more than 100%
  expect_error(land_conditions(fuel_moisture = 101, slope = 1))
 
   #Look for error if fuel moisture is not a number
  expect_error(land_conditions(fuel_moisture = "banana", slope = 1))
  
  #Look for error if slope is more than 90 degrees 
  expect_error(land_conditions(fuel_moisture = 10, slope = 100))
 
   #Look for error if slope is negative
  expect_error(land_conditions(fuel_moisture = 10, slope = -100))
 
   #Look for error if slope is not a number
  expect_error(land_conditions(fuel_moisture = 10, slope = "banana"))
})


#Test 2: Test that lower fuel moisture and higher slope increase fire probability

test_that("land_conditions_works", {
  
  #Test that higher fuel moisture -> lower fire probability
  expect_true(land_conditions(fuel_moisture = 20, slope = 1) >
                land_conditions(fuel_moisture = 21, slope = 1))
  
  #Test that steeper slope -> higher fire probability
  expect_true(land_conditions(fuel_moisture = 10, slope = 10) >
                land_conditions(fuel_moisture = 10, slope = 9))   
  
  #Test that increasing slope by 10 degrees roughly doubles fire probability
  expect_true(land_conditions(fuel_moisture = 10, slope = 18) > 
                1.75*land_conditions(fuel_moisture = 10, slope = 8) &&
                
                land_conditions(fuel_moisture = 10, slope = 18) <
                2.25*land_conditions(fuel_moisture = 10, slope = 8))
})


