#' @title bin_choose
#' @description compute the combination of k successes out of n trials
#' @param k number of successes
#' @param n number of trials
#' @return total number of combination.
#' @export
#' @examples
#' bin_choose(5, 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n,k){
  if(sum(k > n) >0){
    stop("k cannot be greater than n")
  }else{
    factorial(n)/(factorial(n-k)*factorial(k))
  }
}

#' @title bin_probability
#' @description compute the probability of binomial distribution with given trial and success input.
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability of success
#' @return With valid input of parameters, return the computed probability.
#' @export
#' @examples
#' bin_probability(2, 5, 0.5)

bin_probability <- function(success,trials ,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials,success)*(prob^success)*(1-prob)^(trials-success)

}


#' @title bin_distribution
#' @description compute the binomial distribution with given trial and success input.
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the a data frame of the probability distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  success <- 0 :trials
  prob <- bin_probability(success,trials,prob)

  dis <- data.frame(success=success,
                    probability = prob)
  class(dis) <- c("bindis", "data.frame")
  return(dis)
}


#' @export
plot.bindis <- function(x) {
  library(ggplot2)

  plot <- ggplot(data = x, aes(x = success, y = probability)) +
    geom_bar(stat = "identity")+
    theme_bw()

  return(plot)

}


#' @title bin_cumulative
#' @description compute the probability distribution and the cumulative probabilities with
#' givien input
#' @param trials number of trials
#' @param prob probability of success
#' @return return the dataframe with probability distribution and cumulative probabilities
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  success <- 0 :trials
  prob <- bin_probability(success,trials,prob)

  cum <- c()

  for(i in 1:length(success)){
    if(i == 1){
      cum[i] <- prob[i]
    }else{
      cum[i] <- prob[i]+cum[i-1]
    }
  }

  df <- data.frame(success=success,
                   probability = prob,
                   cumulative = cum)
  class(df) <- c("bincum", "data.frame")
  return(df)

}

#' @export
plot.bincum <- function(x){
  library(ggplot2)

  plot <-  ggplot(data = x, aes(x = success, y = cumulative)) +
    geom_point()+
    geom_line()+
    labs(x = "success(cumulative)")+
    theme_bw()
  return(plot)

}


#' @title bin_variable
#' @description creat the binomial random varable object
#' @param trials number of trials
#' @param prob probability of success
#' @return return the binomial variable object
#' @export
#' @examples
#' bin_variable(trials = 10, p = 0.3)
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  binvar <- list(trials = trials, prob = prob)
  class(binvar) <- c("binvar", "list")
  return(binvar)
}


#' @export
print.binvar <- function(x){

  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:",x$trials,"\n")
  cat("- prob of success :",x$prob)
}

#' @export
summary.binvar <- function(x) {
  trials <- x$trials
  prob <- x$prob
  summary.binvar <- list(trials = x$trials,
                         prob = x$prob,
                         mean = aux_mean(trials, prob),
                         variance = aux_variance(trials, prob),
                         mode = aux_mode(trials, prob),
                         skewness = aux_skewness(trials, prob),
                         kurtosis = aux_kurtosis(trials, prob))
  class(summary.binvar) <- c("summary.binvar", "list")
  return(summary.binvar)
}


#' @export
print.summary.binvar <- function(x){
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode    :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis)
}


#' @title bin_mean
#' @description compute the mean.
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the mean
#' @export
#' @examples
#' bin_mean(trials = 5, prob = 0.5)

bin_mean <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials,prob))
}

#' @title bin_variance
#' @description compute the variance.
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the variance
#' @export
#' @examples
#' bin_variance(trials = 5, prob = 0.5)
bin_variance <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials,prob))
}

#' @title bin_mode
#' @description compute the mode.
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the mode
#' @export
#' @examples
#' bin_mode(trials = 5, prob = 0.5)
bin_mode <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}

#' @title bin_skewness
#' @description compute the skewness
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the skewness
#' @export
#' @examples
#' bin_skewness(trials = 5, prob = 0.5)

bin_skewness <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)

  return(aux_skewness(trials,prob))
}

#' @title bin_kurtosis
#' @description compute the kurtosis
#' @param trials number of trials
#' @param prob probability of success
#' @return With valid input of parameters, return the kurtosis
#' @export
#' @examples
#' bin_kurtosis(trials = 5, prob = 0.5)

bin_kurtosis <- function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}
