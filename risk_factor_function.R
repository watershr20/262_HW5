#' Wildfire Risk Factor
#' 
#' This function measures the probability that 2 individuals randomly selected from a sample will belong to the same species.
#' Values is between 0 and 1, with lower values associated with lower diversity.
#' 
#' R = wildfire_probability + ((5000 - distance) / 5000)

#' @param distance distance of site from inhabited building in meters
#' @param wildfire_probability probability of wildfire starting at site 
#' @return risk_score  
#'
#'
risk_factor <- function(wildfire_probability, distance) {
  
  distance_factor <- (5000 - distance) / 5000
  
  risk_score <- wildfire_probability * distance_factor
  
  return(risk_score)
}
