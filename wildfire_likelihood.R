library(tidyverse)
library(here)

wildfire_likelihood = function(climate_risk_factor, land_fire_probability) {
  wildfire_probability = climate_risk_factor*land_fire_probability

  return(wildfire_probability)
}