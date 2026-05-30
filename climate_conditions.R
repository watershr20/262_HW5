#' Climate Fire Risk Probability
#' 
#' This function computes the probability of wildfire likelihood based on climate conditions alone for each site.
#' Higher  values for the climate fire risk probability indicate a greater wildfire likelihood at each site due to average climate conditions measured at that site.

#' @param temperature average temperature at site in degrees Celsius
#' @param humidity average humidity at site in percent
#' @param wind_speed average wind speed at site in km/hr 
#' @param ht hot fire-weather temperature upper bound in degrees Celsius (constant) 
#' @param wv high wind speed upper bound in km/hr (constant) 
#' @return climate_fire_probability 

climate_conditions <- function(temperature, humidity, wind_speed, ht = 40, wv = 60) {
  
  climate_fire_probability <- (
    (temperature / ht) +
    ((100 - humidity) / 100) +
    (wind_speed / wv)
  ) / 3
  
  return(climate_fire_probability)
}

