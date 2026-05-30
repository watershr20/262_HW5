library(tidyverse)
library(here)

wildfire_likelihood = function(climate_fire_probability, land_fire_probability) {
  wildfire_probability = climate_risk_probability * land_fire_probability

  return(wildfire_probability)
}