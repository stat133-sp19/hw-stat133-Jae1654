#Auxilary mean function
#takes trials and prob inputs and compute the mean of the binomial distribution probability and return
aux_mean <- function(trials, prob) {
  return(trials*prob)
}

#Auxilay variance function
#takes trials and prob inputs and compute the variance of the binomial distribution and return it
aux_variance <- function(trials, prob) {
  return((trials*prob)*(1-prob))
}

#Auxilay mode function
#takes in trials and prob inputs  and compute the modes of the binomial distribution and return it
aux_mode <- function(trials, prob) {
  m <- trials*prob + prob
  if (m == round(m)) {
    return (c(m, m-1))
  }
  return (c(floor(m)))
}

#Auxilay skewness function
#takes in trials and prob inputs and compute the skewness of the binomial distribution and return it
aux_skewness <- function(trials, prob) {
  return((1-2*prob)/sqrt((trials*prob)*(1-prob)))
}

#Auxilay kurtosis function
#takes in trials and prob inputs and compute kurtosis of the binomial distribution and return it
aux_kurtosis <- function(trials, prob) {
  return((1-6*prob*(1-prob))/((trials*prob)*(1-prob)))
}
