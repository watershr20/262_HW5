#' Land-Based Fire Probability
#' Calculates the probability of a wildfire igniting and spreading based entirely on land-based conditions for each site
#' Values range from 0 to 1 with higher values indicating a greater fire probability
#' 
#' @param fuel_moisture Amount of water in vegetation as a percent of its dry weight, averaged across the site's area
#' @param slope Average topographic slope of the site in degrees
#' @param fms Fuel moisture sensitivity (factor controlling how much a decrease in fuel moisture leads to an increase in fire probability)
#' @param ignition_threshold Curve shift to increase ignition probability for drier fuels
#' @return land_fire_probability

land_conditions = function(fuel_moisture, slope) {
  
  fms = 0.64 #Fuel moisture sensitivity
  ignition_threshold = -3.92 #Curve shift to increase ignition probability for drier fuels
  
  fuel_ignition_probability <- 1 / (1 + exp(fms * fuel_moisture - ignition_threshold)) #Estimate fuel ignition probability using a logistic style curve from Lawson et al. 
  
  slope_spread_factor <- 2**(slope / 10) #Incorporate the effect of slope on the rate of spread. Rate of spread doubles for every 10 degrees of slope. 
  
  raw_land_fire_factor <- fuel_ignition_probability * slope_spread_factor #Calculate land based fire probability
  land_fire_probability <- raw_land_fire_factor / (1 + raw_land_fire_factor) #Convert to 0-1 scale
  
  return(land_fire_probability)
}

