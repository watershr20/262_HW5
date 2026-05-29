#' Climate Risk Factor
#' 
#' This function measures the probability that 2 individuals randomly selected from a sample will belong to the same species.
#' Values is between 0 and 1, with lower values associated with lower diversity.
#' 
#' climate_risk = (temperature / 40) +  ((100 - humidity) / 100) +  (wind_speed / 60)

#' @param temperature average temperature at site
#' @param humidity average humidity at site 
#' @param wind_speed average wind speed at site 
#' @return climate_risk_factor  
#'
#'
climate_conditions <- function(temperature, humidity, wind_speed) {
  
  climate_risk_factor <-
    (temperature / 40) +
    ((100 - humidity) / 100) +
    (wind_speed / 60)
  
  return(climate_risk_factor)
}