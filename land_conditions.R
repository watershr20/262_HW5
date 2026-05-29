library(tidyverse)
library(here)

land_conditions = function(fuel_moisture, slope) {

  fuel_ignition_probability = 1 / (1 + exp(0.64*fuel_moisture - 3.92)) #Estimate fuel ignition probability using a logistic style curve from Lawson et al. 
  slope_spread_factor = 2**(slope/10) #Incorporate the effect of slope on the rate of spread. Rate of spread doubles for every 10 degrees of slope. 
  land_fire_probability = fuel_ignition_probability * slope_spread_factor
  return(land_fire_probability)
}

