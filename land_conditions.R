library(tidyverse)
library(here)


land_conditions = function(fuel_moisture, slope) {
  
  fms = 0.64 #Fuel moisture sensitivity
  ignition_threshold = -3.92 #Curve shift to increase ignition probability for drier fuels
  
  fuel_ignition_probability <- 1 / (1 + exp(fms * fuel_moisture - ignition_threshold)) #Estimate fuel ignition probability using a logistic style curve from Lawson et al. 
  
  slope_spread_factor <- 2**(slope / 10) #Incorporate the effect of slope on the rate of spread. Rate of spread doubles for every 10 degrees of slope. 
  
  raw_land_fire_factor <- fuel_ignition_probability * slope_spread_factor #Calculate land based fire probability and convert to a 0-1 scale
  land_fire_probability <- raw_land_fire_factor / (1 + raw_land_fire_factor)
  
  return(land_fire_probability)
}

