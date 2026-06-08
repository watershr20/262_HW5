#' Wildfire Likelihood
#' Calculates the overall probability of a wildfire occurring at a site by combining probabilities from land-based factors and climate-related factors
#' Values range from 0 to 1 with higher values indicating greater fire probability
#' 
#' @param climate_fire_probability Probability (from 0 to 1) of a fire occurring based on climate conditions. 
#' @param land_fire_probability Probability (from 0 to 1) of a fire occurring based on land-based conditions. 
#' @return wildfire_probability

wildfire_likelihood = function(climate_fire_probability, land_fire_probability) {
  wildfire_probability = climate_fire_probability * land_fire_probability

  return(wildfire_probability)
}